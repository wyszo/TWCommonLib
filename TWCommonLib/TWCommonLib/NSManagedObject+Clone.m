/**
 Original source: http://stackoverflow.com/questions/2730832/how-can-i-duplicate-or-copy-a-core-data-managed-object
 */

@import KZAsserts;
#import "NSManagedObject+Clone.h"


@implementation NSManagedObject (Clone)

#pragma mark - public interface

- (NSManagedObject *)clone {
  return [self cloneInContext:[self managedObjectContext] exludeEntities:@[]];
}

- (NSManagedObject *)cloneInContext:(NSManagedObjectContext *)context withCopiedCache:(NSMutableDictionary *)alreadyCopied exludeEntities:(NSArray *)namesOfEntitiesToExclude {

  if ([namesOfEntitiesToExclude containsObject:[self entityName]]) {
    return nil;
  }
  
  NSManagedObject *cloned = [alreadyCopied objectForKey:[self objectID]];
  if (cloned != nil) {
    return cloned;
  }
  
  //create new object in data store
  cloned = [NSEntityDescription insertNewObjectForEntityForName:[self entityName] inManagedObjectContext:context];
  [alreadyCopied setObject:cloned forKey:[self objectID]];
  [self cloneOwnAttributesToObject:cloned];
  [self cloneOwnRelationshipsToObject:cloned inContext:context withCopiedCache:alreadyCopied exludeEntities:namesOfEntitiesToExclude];
  
  return cloned;
}

-(NSManagedObject *)cloneInContext:(NSManagedObjectContext *)context exludeEntities:(NSArray *)namesOfEntitiesToExclude {
  return [self cloneInContext:context withCopiedCache:[NSMutableDictionary dictionary] exludeEntities:namesOfEntitiesToExclude];
}

#pragma mark - private implementation

- (NSString *)entityName
{
  return [[self entity] name];
}

- (void)cloneOwnAttributesToObject:(nonnull NSManagedObject *)cloned
{
  AssertTrueOrReturn(cloned);
  
  NSArray *keys = [[self.entity attributesByName] allKeys];
  NSDictionary *attributes = [self dictionaryWithValuesForKeys:keys];
  [cloned setValuesForKeysWithDictionary:attributes];
}

- (void)cloneOwnRelationshipsToObject:(nonnull NSManagedObject *)cloned inContext:(nonnull NSManagedObjectContext *)context withCopiedCache:(NSMutableDictionary *)alreadyCopied exludeEntities:(NSArray *)namesOfEntitiesToExclude
{
  AssertTrueOrReturn(cloned);
  
  NSDictionary *relationships = [[NSEntityDescription entityForName:[self entityName] inManagedObjectContext:context] relationshipsByName];
  for (NSString *relationName in [relationships allKeys]){
    NSRelationshipDescription *relationDescription = [relationships objectForKey:relationName];
    
    NSString *keyName = relationDescription.name;
    if ([relationDescription isToMany]) {
      if ([relationDescription isOrdered]) {
        NSMutableOrderedSet *sourceSet = [self mutableOrderedSetValueForKey:keyName];
        NSMutableOrderedSet *clonedSet = [cloned mutableOrderedSetValueForKey:keyName];
        
        NSEnumerator *enumerator = [sourceSet objectEnumerator];
        
        NSManagedObject *relatedObject;
        while ( relatedObject = [enumerator nextObject]){
          //Clone it, and add clone to set
          NSManagedObject *clonedRelatedObject = [relatedObject cloneInContext:context withCopiedCache:alreadyCopied exludeEntities:namesOfEntitiesToExclude];
          
          [clonedSet addObject:clonedRelatedObject];
          [clonedSet addObject:clonedRelatedObject];
        }
      }
      else {
        NSMutableSet *sourceSet = [self mutableSetValueForKey:keyName];
        NSMutableSet *clonedSet = [cloned mutableSetValueForKey:keyName];
        NSEnumerator *enumerator = [sourceSet objectEnumerator];
        NSManagedObject *relatedObject;
        while ( relatedObject = [enumerator nextObject]){
          //Clone it, and add clone to set
          NSManagedObject *clonedRelatedObject = [relatedObject cloneInContext:context withCopiedCache:alreadyCopied exludeEntities:namesOfEntitiesToExclude];
          
          [clonedSet addObject:clonedRelatedObject];
        }
      }
    }
    else {
      NSManagedObject *relatedObject = [self valueForKey:keyName];
      if (relatedObject != nil) {
        NSManagedObject *clonedRelatedObject = [relatedObject cloneInContext:context withCopiedCache:alreadyCopied exludeEntities:namesOfEntitiesToExclude];
        [cloned setValue:clonedRelatedObject forKey:keyName];
      }
    }
  }
}

@end