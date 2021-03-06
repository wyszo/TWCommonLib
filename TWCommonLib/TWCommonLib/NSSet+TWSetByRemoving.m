//
//  TWCommonLib
//

#import "NSSet+TWSetByRemoving.h"

@implementation NSSet(TWSetByRemovingSet)

- (NSSet *)tw_setByRemovingObjectsInSet:(NSSet *)setToRemove
{
  if (setToRemove.count == 0) {
    return self;
  }
  
  NSMutableSet *mutableSet = [self mutableCopy];
  [mutableSet minusSet:setToRemove];
  return [mutableSet copy];
}

- (NSSet *)tw_setByRemovingObject:(id)object
{
    NSMutableSet *mutableSet = [self mutableCopy];
    [mutableSet removeObject:object];
    return [mutableSet copy];
}

@end
