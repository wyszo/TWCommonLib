//
//  TWCommonLib
//

@import Foundation;
#import "TWCommonMacros.h"

/**
  A delegate that connects UITextView with a UILabel to present remaining character count. You can still implement another UITextViewDelegate using fallbackDelegate property (it'll be set automatically to a previous textView delegate). 
  Both UITextView and UILabel have to already exist (and should be already added to the view hierarchy).
  Additionally if textView is over character limit, font color will change to red. 
 */
@interface TWTextViewWithCharacterLimitLabelDelegate : NSObject <UITextViewDelegate>

@property (nonatomic, copy) void (^overCharacterLimitValueChanged)(BOOL overCharacterLimit);
@property (weak, nonatomic) id<UITextViewDelegate> fallbackDelegate;
@property (assign, nonatomic) BOOL overCharacterLimit;

NEW_AND_INIT_UNAVAILABLE

/**
 Current textView.delegate will automatically be set as a fallbackDelegate.
 */
- (instancetype)initWithCharacterLimitLabel:(UILabel *)characterLimitLabel maxLength:(NSInteger)maxLength attachToTextView:(UITextView *)textView;

@end
