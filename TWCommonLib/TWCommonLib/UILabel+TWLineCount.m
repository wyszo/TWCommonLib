//
//  TWCommonLib
//

@import KZAsserts;
#import "UILabel+TWLineCount.h"
#import "NSString+TWSizing.h"

@implementation UILabel (TWLineCount)

- (NSInteger)tw_lineCount
{
  CGFloat height = [self.text tw_heightForRectWith:self.bounds.size.width withFont:self.font];
  return ceil(height / self.font.lineHeight);
}

@end
