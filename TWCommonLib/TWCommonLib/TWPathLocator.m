//
//  TWCommonLib
//

@import KZAsserts;
#import "TWPathLocator.h"

@implementation TWPathLocator

- (NSString *)documentsPath
{
  return [[self documentsPathURL] path];
}

- (NSURL *)documentsPathURL
{
  NSArray *documentsURLs = [[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask];
  AssertTrueOrReturnNil(documentsURLs.count);
  return [documentsURLs lastObject];
}

- (void)printDocumentsPath
{
  NSLog(@"documents path: %@", [self documentsPath]);
}

@end
