//
//  TWCommonLib
//

@import KZAsserts;
#import "UIView+LayerDecoration.h"

@implementation UIView (TWLayerDecoration)

- (void)tw_addBorderWithWidth:(CGFloat)borderWidth color:(UIColor *)borderColor
{
  AssertTrueOrReturn(borderColor);
  AssertTrueOrReturn(borderWidth >= 0);
  
  self.layer.borderWidth = borderWidth;
  self.layer.borderColor = borderColor.CGColor;
}

- (void)tw_addTopBorderWithWidth:(CGFloat)borderWidth color:(UIColor *)borderColor
{
  AssertTrueOrReturn(borderColor);
  
  CALayer *topBorder = [CALayer layer];
  topBorder.backgroundColor = [borderColor CGColor];
  topBorder.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame), borderWidth);
  [self.layer addSublayer:topBorder];
}

- (void)tw_setCornerRadius:(CGFloat)cornerRadius
{
  AssertTrueOrReturn(cornerRadius >= 0);
  self.layer.cornerRadius = cornerRadius;
  self.layer.masksToBounds = YES;
}

@end
