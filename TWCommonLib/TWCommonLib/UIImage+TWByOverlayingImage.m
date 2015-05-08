//
//  TWCommonLib
//

#import "UIImage+TWByOverlayingImage.h"
#import <KZAsserts/KZAsserts.h>
#import "TWRectangleMath.h"


@implementation UIImage (TWByOverlayingImage)

- (UIImage *)tw_imageByOverlayingWithConcentricImage:(UIImage *)image extendSizeIfDoesntFit:(BOOL)extendSizeIfDoesntFit
{
  AssertTrueOrReturnNil(image);
  
  CGSize combinedImageSize = self.size;
  if (extendSizeIfDoesntFit) {
    combinedImageSize = [TWRectangleMath rectangleUnionSizeFromRectangleWithSize:self.size andRectangleWithSize:image.size];
  }
  
  UIGraphicsBeginImageContext(combinedImageSize);
  
  CGPoint firstImageTopLeftForCombinedSize = [TWRectangleMath topLeftPointOfRectangleWithSize:self.size concentricWithRectangleWithSize:image.size];
  [self drawAtPoint:firstImageTopLeftForCombinedSize];
  
  CGPoint secondImageTopLeftForCombinedSize = [TWRectangleMath topLeftPointOfRectangleWithSize:image.size concentricWithRectangleWithSize:self.size];
  [image drawAtPoint:secondImageTopLeftForCombinedSize];
  
  UIImage *overlayedImage = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  
  AssertTrueOrReturnNil(overlayedImage);
  return overlayedImage;
}

- (UIImage *)tw_imageByOverlayingWithImage:(UIImage *)image atPoint:(CGPoint)imageCenter
{
  return [self tw_imageByOverlayingWithImage:image atPoint:imageCenter withSize:image.size];
}

- (UIImage *)tw_imageByOverlayingWithImage:(UIImage *)image atPoint:(CGPoint)imageCenter withSize:(CGSize)imageSize
{
  AssertTrueOrReturnNil(image);
  
  UIGraphicsBeginImageContext(self.size);
  
  CGPoint firstImageTopLeftForCombinedSize = [TWRectangleMath topLeftPointOfRectangleWithSize:self.size concentricWithRectangleWithSize:image.size];
  [self drawAtPoint:firstImageTopLeftForCombinedSize];
  
  CGPoint imageTopLeft = [TWRectangleMath topLeftPointOfRectangleWithSize:imageSize centerPoint:imageCenter];
  CGRect rect = CGRectMake(imageTopLeft.x, imageTopLeft.y, imageSize.width, imageSize.height);
  rect = CGRectIntegral(rect);
  [image drawInRect:rect];
  
  UIImage *overlayedImage = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  
  AssertTrueOrReturnNil(overlayedImage);
  return overlayedImage;
}

@end
