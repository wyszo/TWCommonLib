//
//  TWCommonLib
//

#import "UIScreen+TWScreenSize.h"

@implementation UIScreen (TWScreenSize)

+ (CGFloat)tw_width
{
  return [UIScreen mainScreen].bounds.size.width;
}

+ (CGFloat)tw_height
{
  return [UIScreen mainScreen].bounds.size.height;
}

@end
