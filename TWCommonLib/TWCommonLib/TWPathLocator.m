//
//  TWCommonLib
//

#import "TWPathLocator.h"
#import <KZAsserts/KZAsserts.h>


@implementation TWPathLocator

- (NSString *)documentsPath
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
