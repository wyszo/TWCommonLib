//  TWCommonLib

@import KZAsserts;
@import MobileCoreServices;
#import "TWUIComponentsFactory.h"

@implementation TWUIComponentsFactory

- (UIImagePickerController *)cameraImagePickerControllerShowingCameraControls:(BOOL)showCameraControls
{
  UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
  
  AssertTrueOrReturnNil([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]);
  imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
  imagePicker.mediaTypes = @[ (NSString *)kUTTypeImage ];
  imagePicker.showsCameraControls = showCameraControls;  
  return imagePicker;
}

@end
