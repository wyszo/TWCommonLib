//
//  TWCommonLib
//

@import Foundation;
#import "TWCommonTypes.h"

@interface TWAssetsHelper : NSObject

/**
 Method for easily obtaining local urls for vidoes that reside in iCloud (when choosen from UIImagePicker).
 
 UIImagePickerController info dictionary contains UIImagePickerControllerReferenceURL key value for assets just downloaded from iCloud
 */
- (void)videoAssetLocalURLForICloudReferenceURL:(nonnull NSURL *)referenceURL completion:(nonnull void (^)(NSURL * __nullable videoURL))completion;

/**
 Copies the iCloud video (with a referenceURL taken from UIImagePickerController info dictionary UIImagePickerControllerReferenceURL value) to a local outputLocalURL (a new file in Cache or Documents directory).
 */
- (void)videoExportFromPhotoLibraryWithReferenceURL:(nonnull NSURL *)referenceURL outputLocalURL:(nonnull NSURL *)outputLocalURL completion:(nullable VoidBlockWithError)completion;

@end
