//
//  TWCommonLib
//

#import "UIScrollView+TWScrolling.h"

@implementation UIScrollView (TWScrolling)

- (void)tw_stopScrolling
{
  CGPoint offset = self.contentOffset;
  [self setContentOffset:offset animated:NO];
}

@end
