//
//  TWCommonLib
//

#import "TWCommonMacros.h"


@interface TWTextViewWithMaxLengthDelegate : NSObject <UITextViewDelegate>

@property (nonatomic, assign) BOOL resignsFirstResponderOnPressingReturn;

NEW_AND_INIT_UNAVAILABLE
- (instancetype)initWithMaxLength:(NSInteger)maxLength attachToTextView:(UITextView *)textView;

@end
