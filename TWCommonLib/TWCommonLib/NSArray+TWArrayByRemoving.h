#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface NSArray (TWArrayByRemoving)

- (NSArray *)tw_arrayByRemovingObjectsInArray:(NSArray *)arrayToRemove;
- (NSArray *)tw_arrayByRemovingObject:(id)object;

@end
NS_ASSUME_NONNULL_END
