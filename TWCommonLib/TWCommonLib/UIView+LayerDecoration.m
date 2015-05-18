//
//  TWCommonLib
//

#import "UIView+LayerDecoration.h"
#import <KZAsserts.h>


@implementation UIView (LayerDecoration)

- (void)addBorderWithWidth:(CGFloat)borderWidth color:(UIColor *)borderColor
{
  AssertTrueOrReturn(borderColor);
  AssertTrueOrReturn(borderWidth >= 0);
  
  self.layer.borderWidth = borderWidth;
  self.layer.borderColor = borderColor.CGColor;
}

- (void)setCornerRadius:(CGFloat)cornerRadius
{
  AssertTrueOrReturn(cornerRadius >= 0);
  self.layer.cornerRadius = cornerRadius;
  self.layer.masksToBounds = YES;
}

@end
