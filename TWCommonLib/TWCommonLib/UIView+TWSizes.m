//
//  TWCommonLib
//

#import "UIView+TWSizes.h"

@implementation UIView (TWSizes)

- (CGFloat)tw_top
{
  return self.frame.origin.y;
}

- (void)setTw_top:(CGFloat)tw_top
{
  CGRect frame = self.frame;
  frame.origin.y = tw_top;
  self.frame = frame;
}

- (CGFloat)tw_bottom
{
  return ([self tw_top] + self.frame.size.height);
}

- (void)setTw_bottom:(CGFloat)tw_bottom
{
  CGRect frame = self.frame;
  frame.origin.y = (tw_bottom - frame.size.height);
  self.frame = frame;
}

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
