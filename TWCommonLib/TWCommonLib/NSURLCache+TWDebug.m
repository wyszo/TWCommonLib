//
//  TWCommonLib
//

#import "NSURLCache+TWDebug.h"

@implementation NSURLCache (TWDebug)

- (void)tw_debug_clearCache
{
  [self removeAllCachedResponses];
}

@end
