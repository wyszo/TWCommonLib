//
//  TWCommonLib
//

#import "UIScrollView+StopScrolling.h"

@implementation UIScrollView (StopScrolling)

- (void)tw_stopScrolling
{
  CGPoint offset = self.contentOffset;
  [self setContentOffset:offset animated:NO];
}

@end
