//
//  TWCommonLib
//

@import KZAsserts;
#import "UIImage+TWByOverlayingImage.h"
#import "TWRectangleMath.h"
#import "TWCommonMacros.h"
#import "UIImage+TWCreateImage.h"

@implementation UIImage (TWByOverlayingImage)

- (UIImage *)tw_imageByOverlayingWithConcentricImage:(UIImage *)image extendSizeIfDoesntFit:(BOOL)extendSizeIfDoesntFit
{
  AssertTrueOrReturnNil(image);
  
  CGSize combinedImageSize = self.size;
  if (extendSizeIfDoesntFit) {
    combinedImageSize = [TWRectangleMath rectangleUnionSizeFromRectangleWithSize:self.size andRectangleWithSize:image.size];
  }
  
  UIImage *overlayedImage = [UIImage tw_createImageWithSize:combinedImageSize drawingBlock:^{
    CGPoint firstImageTopLeftForCombinedSize = [TWRectangleMath topLeftPointOfRectangleWithSize:self.size concentricWithRectangleWithSize:image.size];
    [self drawAtPoint:firstImageTopLeftForCombinedSize];
    
    CGPoint secondImageTopLeftForCombinedSize = [TWRectangleMath topLeftPointOfRectangleWithSize:image.size concentricWithRectangleWithSize:self.size];
    [image drawAtPoint:secondImageTopLeftForCombinedSize];
  }];
  
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
  
  UIImage *overlayedImage = [UIImage tw_createImageWithSize:self.size drawingBlock:^{
    CGPoint firstImageTopLeftForCombinedSize = [TWRectangleMath topLeftPointOfRectangleWithSize:self.size concentricWithRectangleWithSize:image.size];
    [self drawAtPoint:firstImageTopLeftForCombinedSize];
    
    CGPoint imageTopLeft = [TWRectangleMath topLeftPointOfRectangleWithSize:imageSize centerPoint:imageCenter];
    CGRect rect = CGRectMake(imageTopLeft.x, imageTopLeft.y, imageSize.width, imageSize.height);
    rect = CGRectIntegral(rect);
    [image drawInRect:rect];
  }];
  
  AssertTrueOrReturnNil(overlayedImage);
  return overlayedImage;
}

@end
