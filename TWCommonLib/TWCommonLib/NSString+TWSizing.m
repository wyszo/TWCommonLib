//
//  TWCommonLib
//

@import KZAsserts;
#import "NSString+TWSizing.h"

@implementation NSString (TWSizing)

- (CGFloat)tw_heightForRectWith:(CGFloat)width withFont:(nonnull UIFont *)font
{
  AssertTrueOr(font, return 0;);
  CGSize rectSize = (CGSize){width, FLT_MAX};
  NSDictionary *attributes = @{ NSFontAttributeName : font };
  
  CGRect rect = [self boundingRectWithSize:rectSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil];
  return rect.size.height;
}

@end
