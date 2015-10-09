//
//  TWCommonLib
//

@import UIKit;

@interface UIScrollView (StopScrolling)

/**
 Forces scrolling to stop immediately (without decelerating). If scroll view is not currently being scrolled, has no effect.
 */
- (void)tw_stopScrolling;

@end
