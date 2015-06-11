//
//  TWCommonLib
//

@import AVFoundation;
@import UIKit;
#import "TWVideoThumbnailHelper.h"
#import <KZAsserts.h>


@implementation TWVideoThumbnailHelper

+ (UIImage *)thumbnailImageFromVideoURL:(NSURL *)videoURL atTimeInSeconds:(NSInteger)seconds
{
  AVURLAsset *asset = [[AVURLAsset alloc] initWithURL:videoURL options:nil];
  AVAssetImageGenerator *imageGenerator = [[AVAssetImageGenerator alloc] initWithAsset:asset];
  imageGenerator.appliesPreferredTrackTransform = YES;
  NSError *error = NULL;
  
  int32_t timescale = 10;
  CMTime time = CMTimeMake(seconds, timescale);
  
  CGImageRef imageRef = [imageGenerator copyCGImageAtTime:time actualTime:NULL error:&error];
  UIImage *thumbnail = [UIImage imageWithCGImage:imageRef];
  AssertTrueOrReturnNil(thumbnail);
  return thumbnail;
}

@end
