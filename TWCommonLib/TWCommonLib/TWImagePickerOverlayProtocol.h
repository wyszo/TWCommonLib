//
//  TWCommonLib
//

#import <Foundation/Foundation.h>


@protocol TWImagePickerOverlayProtocol <NSObject>
@required

- (instancetype)initWithImagePickerController:(UIImagePickerController *)imagePickerController;

- (void)showOverlay;
- (void)hideOverlay;

@end