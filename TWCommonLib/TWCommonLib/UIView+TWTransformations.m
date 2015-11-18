//
//  TWCommonLib
//

#import "UIView+TWTransformations.h"

@implementation UIView (TWTransformations)

- (void)tw_setRotationRadians:(CGFloat)radians
{
  self.transform = CGAffineTransformMakeRotation(radians);
}

@end
