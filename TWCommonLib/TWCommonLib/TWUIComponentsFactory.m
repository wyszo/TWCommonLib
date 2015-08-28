//  TWCommonLib

#import "TWUIComponentsFactory.h"
#import <KZAsserts/KZAsserts.h>
@import MobileCoreServices;


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
