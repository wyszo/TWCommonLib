//
//  TWCommonLib
//

@import Foundation;

@interface TWFilesystemHelper : NSObject

/**
 @returns YES if directory exists or successfully created
 */
- (BOOL)createDirectoryIfDoesntExist:(nonnull NSString *)path;

/**
  @param path - relative name of the directory (can be compond, eg 'user/videos')
  @returns YES if directory exists or successfully created
 */
- (BOOL)createDocumentsSubdirectoryIfDoesntExist:(nonnull NSString *)path;

- (BOOL)removeFileAtPathIfExists:(nonnull NSString *)path;

@end
