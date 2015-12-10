//
//  TWCommonLib
//

#import "TWUIImagePickerHelper.h"

@implementation TWUIImagePickerHelper

- (CGSize)imagePickerCameraPreviewViewSize
{
  // Camera preview view (CamPreviewView, private) always has 4:3 aspect ratio, use that to calculate it's size from screen width
  // The alternative approach to achieve this would be to traverse UIImagePicker view hierarchy, grab CamPreview view and return it's aspect ratio
  // But that's not really any better than this
  CGFloat camPreviewViewAspectRatio = 4.0f / 3.0f;
  
  CGSize screenSize = [UIScreen mainScreen].bounds.size;
  CGFloat height = roundf(screenSize.width * camPreviewViewAspectRatio);
  return CGSizeMake(screenSize.width, height);
}

@end
