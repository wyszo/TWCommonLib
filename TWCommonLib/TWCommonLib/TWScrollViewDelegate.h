//
//  TWCommonLib
//

#import <Foundation/Foundation.h>
#import "TWCommonMacros.h"


@interface TWScrollViewDelegate : NSObject <UIScrollViewDelegate>

NEW_AND_INIT_UNAVAILABLE
@property (nonatomic, copy) void (^didEndDeceleratingBlock)();

- (instancetype)initAttachingToScrollView:(UIScrollView *)scrollView;

@end
