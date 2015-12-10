//
//  TWCommonLib
//

#import "UITableViewCell+TWHideSeparator.h"

@implementation UITableViewCell (TWHideSeparator)

- (void)tw_hideSeparator
{
  self.separatorInset = UIEdgeInsetsMake(0, 0, 0, CGRectGetWidth(self.bounds));
}

- (void)tw_showSeparatorWithMarginInset:(CGFloat)marginInset
{
  self.separatorInset = UIEdgeInsetsMake(0, marginInset, 0, marginInset);
}

- (void)tw_removeLayoutMargins
{
  self.layoutMargins = UIEdgeInsetsZero;
}

- (void)tw_configureForFullWidthSeparators
{
  [self tw_showSeparatorWithMarginInset:0.0f];
  [self tw_removeLayoutMargins];
}

@end
