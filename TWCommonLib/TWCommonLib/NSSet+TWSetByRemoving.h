//
//  TWCommonLib
//

@import UIKit;

NS_ASSUME_NONNULL_BEGIN
@interface NSSet (TWSetByRemoving)

- (NSSet *)tw_setByRemovingObjectsInSet:(NSSet *)setToRemove;
- (NSSet *)tw_setByRemovingObject:(id)object;

@end
NS_ASSUME_NONNULL_END
