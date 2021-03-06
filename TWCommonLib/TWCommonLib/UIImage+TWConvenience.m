//
//  TWCommonLib
//

@import KZAsserts;
#import "UIImage+TWConvenience.h"

@implementation UIImage (TWConvenience)

- (CGFloat)tw_aspectRatio
{
  AssertTrueOr(self.size.height > 0, return 0;);
  return (self.size.width / self.size.height);
}

@end
