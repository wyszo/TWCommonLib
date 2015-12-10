//
//  TWCommonLib
//

@import UIKit;

@interface UIView (TWTransformations)

/**
 Applies rotation CGAffineTransform. Discards previously set AffineTransform.
 Use M_PI and similar constants as an argument. 
 */
- (void)tw_setRotationRadians:(CGFloat)radians;

@end
