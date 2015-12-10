//
//  TWCommonLib
//

@import Foundation;

@interface TWVideoThumbnailHelper : NSObject

+ (UIImage *)thumbnailImageFromVideoURL:(NSURL *)videoURL atTimeInSeconds:(NSInteger)seconds;

@end
