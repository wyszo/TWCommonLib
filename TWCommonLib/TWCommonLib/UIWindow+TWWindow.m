//
//  TWCommonLib
//

#import "UIWindow+TWWindow.h"

@implementation UIWindow (TWWindow)

+ (nullable UIWindow *)tw_keyWindow
{
  return [[UIApplication sharedApplication] keyWindow];
}

@end
