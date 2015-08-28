//  TWCommonLib

#import "UITextView+NumberOfLines.h"

@implementation UITextView (NumberOfLines)

- (NSInteger)tw_realNumberOfLines {
    CGFloat caretHeight = [self tw_caretHeight];
    CGFloat totalHeight = [self tw_currentHeight] + self.textContainerInset.top + self.textContainerInset.bottom;
    NSInteger numberOfLines = (totalHeight / caretHeight);
    return numberOfLines;
}

- (CGFloat)tw_currentHeight {
    CGFloat width = self.bounds.size.width - 2.0 * self.textContainer.lineFragmentPadding;
    CGRect boundingRect = [self.text boundingRectWithSize:CGSizeMake(width, FLT_MAX) options:(NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading) attributes:@{ NSFontAttributeName:self.font} context:nil];
    return boundingRect.size.height;
}

- (CGFloat)tw_caretHeight {
    return [self caretRectForPosition:self.selectedTextRange.end].size.height;
}

@end
