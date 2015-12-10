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

#pragma mark - Scroll to Top

- (void)tw_scrollToTop
{
  [self tw_scrollToTopAnimated:YES];
}

- (void)tw_scrollToTopAnimated:(BOOL)animated
{
  [self setContentOffset:CGPointZero animated:animated];
}

#pragma mark - Scroll to Bottom

- (void)tw_scrollToBottom
{
  [self tw_scrollToBottomAnimated:YES];
}

- (void)tw_scrollToBottomAnimated:(BOOL)animated
{
  CGPoint bottomOffset = CGPointMake(self.contentOffset.x, self.contentSize.height - self.bounds.size.height); // + self.contentInset.bottom);
  
  if (bottomOffset.y < 0.0f) {
    bottomOffset.y = 0; // don't scroll if tableView items don't fill up whole tableView yet
  }
  [self setContentOffset:bottomOffset animated:animated];
}

@end
