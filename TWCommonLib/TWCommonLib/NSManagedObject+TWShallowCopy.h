//
//  TWCommonLib
//

@import CoreData;

@interface NSManagedObject (TWShallowCopy)

/**
 managedObject needs to have the same relationships (be the same type), otherwise it'll crash!
 managedObject doesn't have to be from the same context. 
 */
- (void)tw_shallowCopyRelationshipsWithClasses:(nonnull NSArray *)entityClasses fromManagedObject:(nonnull NSManagedObject *)managedObject;

@end
