//
//  TWCommonLib
//

@import Foundation;

@protocol TWExtendedUIImagePickerControllerDelegate <NSObject>
@required

- (void)imagePickerControllerUserDidCaptureItem;
- (void)imagePickerControllerUserDidPressRetake;

@end
