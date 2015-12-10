//
//  TWCommonLib
//

@import UIKit;

@interface UITextView (TWPadding)

/**
 Requires iOS 7+
 */
- (void)tw_setLeftAndRightPadding:(CGFloat)padding;
- (void)tw_setBottomPadding:(CGFloat)padding;
- (void)tw_setTopPadding:(CGFloat)padding;

@end
