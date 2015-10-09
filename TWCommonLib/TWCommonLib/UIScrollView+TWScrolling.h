//
//  TWCommonLib
//

@import UIKit;

@interface UIScrollView (TWScrolling)

/**
 Forces scrolling to stop immediately (without decelerating). If scroll view is not currently being scrolled, has no effect.
 */
- (void)tw_stopScrolling;

/**
 Scroll to top (animated)
 */
- (void)tw_scrollToTop;

- (void)tw_scrollToTopAnimated:(BOOL)animated;

/**
 Scroll to bottom (animated)
 */
- (void)tw_scrollToBottom;

- (void)tw_scrollToBottomAnimated:(BOOL)animated;

@end
