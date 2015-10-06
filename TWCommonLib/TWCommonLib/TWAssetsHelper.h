//
//  TWCommonLib
//

@import Foundation;

@interface TWAssetsHelper : NSObject

/**
 Method for easily obtaining local urls for vidoes that reside in iCloud (when choosen from UIImagePicker).
 
 UIImagePickerController info dictionary contains UIImagePickerControllerReferenceURL key value for assets just downloaded from iCloud
 */
- (void)videoAssetLocalURLForICloudReferenceURL:(nonnull NSURL *)referenceURL completion:(nonnull void (^)(NSURL * __nullable videoURL))completion;

@end
