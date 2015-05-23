//
//  TWCommonLib
//

#import <Foundation/Foundation.h>
#import "TWCommonMacros.h"
#import "TWImagePickerOverlayProtocol.h"


@interface TWShowImagePickerOverlayWhenOrientationPortraitBehaviour : NSObject

NEW_AND_INIT_UNAVAILABLE

- (instancetype)initWithImagePickerController:(UIImagePickerController *)imagePickerController imagePickerOverlayController:(id<TWImagePickerOverlayProtocol>)imagePickerOverlayController;

- (void)activateBehaviour;

@end
