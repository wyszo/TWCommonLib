//
//  TWCommonLib
//

@import KZAsserts;
@import Photos;
#import "TWAssetsHelper.h"
#import "TWCommonMacros.h"

@implementation TWAssetsHelper

- (void)videoAssetLocalURLForICloudReferenceURL:(nonnull NSURL *)referenceURL completion:(nonnull void (^)(NSURL * __nullable videoURL))completion
{
  AssertTrueOrReturn(referenceURL);
  AssertTrueOrReturn(completion);
  
  PHAsset *asset = [[PHAsset fetchAssetsWithALAssetURLs:@[referenceURL] options:0] firstObject];
  AssertTrueOrReturn(asset);
  
  PHImageManager *imageManager = [PHImageManager defaultManager];
  [imageManager requestAVAssetForVideo:asset options:0 resultHandler:^(AVAsset * _Nullable asset, AVAudioMix * _Nullable audioMix, NSDictionary * _Nullable info) {
    AVURLAsset *urlAsset = (AVURLAsset *)asset;
    NSURL *assetURL = [urlAsset URL];
    
    dispatch_async(dispatch_get_main_queue(), ^{
      completion(assetURL);
    });
  }];
}

- (void)videoExportFromPhotoLibraryWithReferenceURL:(nonnull NSURL *)referenceURL outputLocalURL:(nonnull NSURL *)outputLocalURL completion:(VoidBlockWithError)completion
{
  AssertTrueOrReturn(referenceURL);
  AssertTrueOrReturn(outputLocalURL);
  
  PHAsset *asset = [[PHAsset fetchAssetsWithALAssetURLs:@[referenceURL] options:0] firstObject];
  AssertTrueOrReturn(asset);
  
  PHImageManager *imageManager = [PHImageManager defaultManager];
  
  // TODO: wire up a progress handler
  [imageManager requestExportSessionForVideo:asset options:0 exportPreset:AVAssetExportPresetPassthrough resultHandler:^(AVAssetExportSession * _Nullable exportSession, NSDictionary * _Nullable info) {
    exportSession.outputURL = outputLocalURL;
    exportSession.outputFileType = AVFileTypeQuickTimeMovie;
    
    [exportSession exportAsynchronouslyWithCompletionHandler:^{
      if (exportSession.status == AVAssetExportSessionStatusCompleted) {
        CallBlock(completion, nil);
      } else {
        CallBlock(completion, exportSession.error);
      }
    }];
  }];
}

@end
