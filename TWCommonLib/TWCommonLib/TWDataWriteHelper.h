//
//  TWCommonLib
//

#import "TWCommonTypes.h"

@interface TWDataWriteHelper : NSObject

- (void)writeImageToSavedPhotosAlbum:(UIImage *)image completion:(BlockWithBoolParameter)completion;

@end
