//
//  TWCommonLib
//

#import "UIImage+TWCropping.h"


@implementation UIImage (TWCropping)

- (UIImage *)tw_imageByCroppingCenterToSquare
{
  double refWidth = CGImageGetWidth(self.CGImage);
  double refHeight = CGImageGetHeight(self.CGImage);
  
  double desiredSize = MIN(refWidth, refHeight);
  
  double centerX = (refWidth - desiredSize) / 2.0;
  double centerY = (refHeight - desiredSize) / 2.0;
  
  CGRect cropRect = CGRectMake(centerX, centerY, desiredSize, desiredSize);
  CGImageRef imageRef = CGImageCreateWithImageInRect(self.CGImage, cropRect);
  
  UIImage *croppedImage = [UIImage imageWithCGImage:imageRef scale:0.0 orientation:UIImageOrientationUp];
  return croppedImage;
}

@end
