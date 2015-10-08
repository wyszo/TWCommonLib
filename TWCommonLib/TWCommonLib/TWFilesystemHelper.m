//
//  TWCommonLib
//

@import KZAsserts;
#import "TWFilesystemHelper.h"
#import "TWPathLocator.h"

@implementation TWFilesystemHelper

- (BOOL)createDirectoryIfDoesntExist:(nonnull NSString *)path
{
  AssertTrueOrReturnNo(path.length);
  
  NSFileManager *fileManager = [NSFileManager defaultManager];
  if (![fileManager fileExistsAtPath:path]) {
    NSError *error;
    BOOL success = [fileManager createDirectoryAtPath:path withIntermediateDirectories:YES attributes:0 error:&error];
    if (!success) {
      NSLog(@"Documents subdirectory creation error!");
      AssertTrueOrReturnNo(NO && @"directory creation error");
    }
    return success;
  }
  return YES;
}

- (BOOL)createDocumentsSubdirectoryIfDoesntExist:(nonnull NSString *)relativePath
{
  AssertTrueOrReturnNo(relativePath.length);
  TWPathLocator *pathLocator = [TWPathLocator new];
  
  NSString *fullPath = [[pathLocator documentsPath] stringByAppendingPathComponent:relativePath];
  return [self createDirectoryIfDoesntExist:fullPath];
}

- (BOOL)removeFileAtPathIfExists:(nonnull NSString *)path
{
  AssertTrueOrReturnNo(path.length);
  
  NSFileManager *fileManager = [NSFileManager defaultManager];
  if ([fileManager fileExistsAtPath:path]) {
    NSError *error;
    return [fileManager removeItemAtPath:path error:&error];
  }
  return YES;
}

@end
