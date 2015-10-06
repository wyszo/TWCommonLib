//
//  TWCommonLib
//

@import UIKit;

@interface UITableViewCell (TWHideSeparator)

- (void)tw_hideSeparator;

/**
 @pragma marginInset  separatorInset left and right value - distance from cell margin
 */
- (void)tw_showSeparatorWithMarginInset:(CGFloat)marginInset;

@end
