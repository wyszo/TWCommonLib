//
//  TWCommonLib
//

@import KZAsserts;
@import MagicalRecord;
#import "NSManagedObject+TWShallowCopy.h"

@implementation NSManagedObject (TWShallowCopy)

#pragma mark - public

- (void)tw_shallowCopyRelationshipsWithClasses:(nonnull NSArray *)entityClasses fromManagedObject:(nonnull NSManagedObject *)sourceManagedObject
{
  AssertTrueOrReturn(entityClasses.count);
  AssertTrueOrReturn(sourceManagedObject);
  AssertTrueOrReturn([sourceManagedObject isMemberOfClass:[self class]]); // very strict restriction, might change in the future
  
  NSManagedObjectContext *currentContext = self.managedObjectContext;
  
  for (Class entityClass in entityClasses) {
    NSArray<NSRelationshipDescription *> *relationships = [self relationshipsWithEntityOfClass:entityClass inContext:currentContext];
    [relationships enumerateObjectsUsingBlock:^(NSRelationshipDescription * _Nonnull relationshipDescription, NSUInteger idx, BOOL * _Nonnull stop) {
      NSString *keyName = relationshipDescription.name;
      
      if ([relationshipDescription isToMany]) {
        [self copyOneToManyRelationshipsForKey:keyName isRelationOrdered:[relationshipDescription isOrdered] fromObject:sourceManagedObject];
      } else {
        [self copyOneToOneRelationshipValueForKey:keyName fromObject:sourceManagedObject];
      }
    }];
  }
}

#pragma mark - private

- (NSArray<NSRelationshipDescription *> *)relationshipsWithEntityOfClass:(nonnull Class)entityClass inContext:(nonnull NSManagedObjectContext *)context
{
  AssertTrueOrReturnNil(entityClass);
  AssertTrueOrReturnNil(context);
  
  NSEntityDescription *currentEntityDescription = [self entityDescriptionForClass:[self class] inContext:self.managedObjectContext];
  NSEntityDescription *targetEntityDescription = [self entityDescriptionForClass:[entityClass class] inContext:self.managedObjectContext];
  
  NSArray<NSRelationshipDescription *> *relationships = [currentEntityDescription relationshipsWithDestinationEntity:targetEntityDescription];
  return relationships;
}

- (NSEntityDescription *)entityDescriptionForClass:(nonnull Class)entityClass inContext:(nonnull NSManagedObjectContext *)context
{
  AssertTrueOrReturnNil(entityClass);
  AssertTrueOrReturnNil(context);
  
  NSString *entityName = NSStringFromClass(entityClass);
  NSEntityDescription *entityDescription = [NSEntityDescription entityForName:entityName inManagedObjectContext:context];
  return entityDescription;
}

- (void)copyOneToOneRelationshipValueForKey:(nonnull NSString *)relationshipName fromObject:(nonnull NSManagedObject *)sourceManagedObject
{
  AssertTrueOrReturn(relationshipName);
  AssertTrueOrReturn(sourceManagedObject);
  
  NSManagedObject *managedObject = [sourceManagedObject valueForKey:relationshipName];
  NSManagedObject *managedObjectInCurrentContext = [managedObject MR_inContext:self.managedObjectContext];
  
  [self setValue:managedObjectInCurrentContext forKey:relationshipName];
}

- (void)copyOneToManyRelationshipsForKey:(nonnull NSString *)relationshipName isRelationOrdered:(BOOL)relationOrdered fromObject:(nonnull NSManagedObject *)sourceManagedObject
{
  AssertTrueOrReturn(relationshipName);
  AssertTrueOrReturn(sourceManagedObject);

  if (relationOrdered) {
    AssertTrueOrReturn(NO && @"shallow copying ordered relationships not implemented yet!");
  } else {
    NSMutableSet *sourceSet = [sourceManagedObject mutableSetValueForKey:relationshipName];
    NSMutableSet *resultSet = [NSMutableSet set];
    
    [sourceSet enumerateObjectsUsingBlock:^(NSManagedObject * _Nonnull managedObject, BOOL * _Nonnull stop) {
      NSManagedObject *managedObjectInContext = [managedObject MR_inContext:self.managedObjectContext];
      [resultSet addObject:managedObjectInContext];
    }];
    
    [self setValue:resultSet forKey:relationshipName];
  }
}

@end
