//
//  TWCommonLib
//

#import "UIImagePickerController+TWCameraDeviceSwitching.h"


@implementation UIImagePickerController (TWCameraDeviceSwitching)

- (void)setIfAvailableCameraCaptureDevice:(UIImagePickerControllerCameraDevice)captureDevice
{
  if ([UIImagePickerController isCameraDeviceAvailable:captureDevice]) {
    self.cameraDevice = captureDevice;
  }
}

@end
