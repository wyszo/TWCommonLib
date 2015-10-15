#import "NSArray+TWArrayByRemoving.h"

@implementation NSArray (TWArrayByRemoving)
- (NSArray *)tw_arrayByRemovingObjectsInArray:(NSArray *)arrayToRemove
{
    if (arrayToRemove.count == 0) {
        return self;
    }
    
    NSMutableArray *mutableArray = [self mutableCopy];
    [mutableArray removeObjectsInArray:arrayToRemove];
    return [mutableArray copy];
}

- (NSArray *)tw_arrayByRemovingObject:(id)object
{
    NSMutableArray *mutableArray = [self mutableCopy];
    [mutableArray removeObject:object];
    return [mutableArray copy];
}

@end
