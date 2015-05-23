//
//  TWCommonLib
//

#import <Foundation/Foundation.h>


@protocol TWExtendedUIImagePickerControllerDelegate <NSObject>
@required

- (void)imagePickerControllerUserDidCaptureItem;
- (void)imagePickerControllerUserDidPressRetake;

@end
