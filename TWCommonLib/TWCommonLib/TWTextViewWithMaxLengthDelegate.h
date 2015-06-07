//
//  TWCommonLib
//

#import "TWCommonMacros.h"
#import "TWCommonTypes.h"


@interface TWTextViewWithMaxLengthDelegate : NSObject <UITextViewDelegate>

@property (nonatomic, assign) BOOL resignsFirstResponderOnPressingReturn;
@property (nonatomic, copy) void (^textDidChange)(NSString *text);
@property (nonatomic, copy) VoidBlock textViewDidBeginEditing;
@property (nonatomic, copy) VoidBlock textViewDidEndEditing;

NEW_AND_INIT_UNAVAILABLE
- (instancetype)initWithMaxLength:(NSInteger)maxLength attachToTextView:(UITextView *)textView;

@end
