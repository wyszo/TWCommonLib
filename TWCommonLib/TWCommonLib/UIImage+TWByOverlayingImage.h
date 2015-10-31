//
//  TWCommonLib
//

@import UIKit;

@interface UIImage (TWByOverlayingImage)

- (UIImage *)tw_imageByOverlayingWithConcentricImage:(UIImage *)image extendSizeIfDoesntFit:(BOOL)extendSizeIfDoesntFit;
- (UIImage *)tw_imageByOverlayingWithImage:(UIImage *)image atPoint:(CGPoint)imageCenter;
- (UIImage *)tw_imageByOverlayingWithImage:(UIImage *)image atPoint:(CGPoint)imageCenter withSize:(CGSize)imageSize;

@end
