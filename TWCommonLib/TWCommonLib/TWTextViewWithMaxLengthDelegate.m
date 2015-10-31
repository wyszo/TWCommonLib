//
//  TWCommonLib
//

@import KZAsserts;
#import "TWTextViewWithMaxLengthDelegate.h"

@interface TWTextViewWithMaxLengthDelegate ()
@property (nonatomic, assign) NSInteger maxLength;
@end

@implementation TWTextViewWithMaxLengthDelegate

- (instancetype)initWithMaxLength:(NSInteger)maxLength attachToTextView:(UITextView *)textView
{
  AssertTrueOrReturnNil(textView);
  
  self = [super init];
  if (self) {
    _maxLength = maxLength;
    textView.delegate = self;
  }
  return self;
}

#pragma mark - UITextViewDelegate

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
  if (self.resignsFirstResponderOnPressingReturn && [text isEqualToString:@"\n"]) {
    [textView resignFirstResponder];
    return NO;
  }
  
  NSInteger newTextLength = textView.text.length + text.length - range.length;
  return ![self textLengthExceedsMaxLength:newTextLength];
}

- (void)textViewDidBeginEditing:(UITextView *)textView
{
  CallBlock(self.textViewDidBeginEditing);
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
  CallBlock(self.textViewDidEndEditing);
}

- (void)textViewDidChange:(UITextView *)textView
{
  CallBlock(self.textDidChange, textView.text);
}

- (BOOL)textLengthExceedsMaxLength:(NSInteger)textLength
{
  return (textLength > self.maxLength);
}

@end
