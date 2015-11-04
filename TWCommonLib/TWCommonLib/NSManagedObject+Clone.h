/**
 Original source: http://stackoverflow.com/questions/2730832/how-can-i-duplicate-or-copy-a-core-data-managed-object
 */

@import Foundation;
@import CoreData;


@interface NSManagedObject (Clone) 

// performs a deep copy of attributes and relationships (apart from excluded entities)
- (NSManagedObject *)cloneInContext:(NSManagedObjectContext *)context withCopiedCache:(NSMutableDictionary *)alreadyCopied exludeEntities:(NSArray *)namesOfEntitiesToExclude;

// performs a deep copy of attributes and relationships (apart from excluded entities)
- (NSManagedObject *)cloneInContext:(NSManagedObjectContext *)context exludeEntities:(NSArray *)namesOfEntitiesToExclude;

// performs a deep copy of attributes and relationships (apart from excluded entities)
- (NSManagedObject *)clone;

@end
