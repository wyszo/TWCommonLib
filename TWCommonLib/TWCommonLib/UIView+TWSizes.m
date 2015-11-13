//
//  TWCommonLib
//

#import "UIView+TWSizes.h"

@implementation UIView (TWSizes)

- (CGFloat)tw_width
{
  return self.frame.size.width;
}

- (void)setTw_width:(CGFloat)tw_width
{
  CGRect frame = self.frame;
  frame.size.width = tw_width;
  self.frame = frame;
}

- (CGFloat)tw_height
{
  return self.frame.size.height;
}

- (void)setTw_height:(CGFloat)tw_height
{
  CGRect frame = self.frame;
  frame.size.height = tw_height;
  self.frame = frame;
}

@end
