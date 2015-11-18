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

// Together with setting marginInsets to 0 will allow to display full width separator
- (void)tw_removeLayoutMargins;

- (void)tw_configureForFullWidthSeparators;

@end
