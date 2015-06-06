//
//  TWCommonLib
//

#import "UITextView+TWPadding.h"


@implementation UITextView (TWPadding)

- (void)tw_setLeftAndRightPadding:(CGFloat)padding
{
  UIEdgeInsets insets = self.textContainerInset;
  self.textContainerInset = UIEdgeInsetsMake(insets.top, padding, insets.bottom, padding);
}

- (void)tw_setBottomPadding:(CGFloat)padding
{
  UIEdgeInsets insets = self.textContainerInset;
  self.textContainerInset = UIEdgeInsetsMake(insets.top, insets.left, padding, insets.right);
}

- (void)tw_setTopPadding:(CGFloat)padding
{
  UIEdgeInsets insets = self.textContainerInset;
  self.textContainerInset = UIEdgeInsetsMake(padding, insets.left, insets.bottom, insets.right);
}

@end
