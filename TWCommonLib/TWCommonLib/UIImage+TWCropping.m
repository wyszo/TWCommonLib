//
//  TWCommonLib
//

@import KZAsserts;
#import "UIImage+TWCropping.h"

@implementation UIImage (TWCropping)

- (UIImage *)tw_imageByCroppingCenterToSquare
{
  return [self tw_imageByCroppingCenterToSquareWithCenterPointOffset:CGPointZero];
}

- (UIImage *)tw_imageByCroppingCenterToSquareWithCenterPointOffset:(CGPoint)offset
{
  AssertTrueOrReturnNil(offset.x >= -self.size.width && offset.x <= self.size.width);
  AssertTrueOrReturnNil(offset.y >= -self.size.height && offset.y <= self.size.height);
  
  double refWidth = CGImageGetWidth(self.CGImage);
  double refHeight = CGImageGetHeight(self.CGImage);
  
  double desiredSize = MIN(refWidth, refHeight);
  
  double centerX = (refWidth - desiredSize) / 2.0 + offset.x;
  double centerY = (refHeight - desiredSize) / 2.0 + offset.y;
  
  CGRect cropRect = CGRectMake(centerX, centerY, desiredSize, desiredSize);
  CGImageRef imageRef = CGImageCreateWithImageInRect(self.CGImage, cropRect);
  
  UIImage *croppedImage = [UIImage imageWithCGImage:imageRef scale:0.0 orientation:self.imageOrientation];
  return croppedImage;
}

@end
