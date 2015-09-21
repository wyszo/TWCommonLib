//
//  TWCommonLib
//

#import "TWTextViewWithCharacterLimitLabelDelegate.h"
#import "NSObject+TWObjectLifetime.h"
#import <KZAsserts/KZAsserts.h>


@interface TWTextViewWithCharacterLimitLabelDelegate ()

@property (assign, nonatomic) NSInteger remainingCharactersCount;
@property (assign, nonatomic) NSInteger maxLength;
@property (assign, nonatomic) BOOL lastOverCharacterLimitValue;
@property (weak, nonatomic) UITextView *textView;
@property (strong, nonatomic) UIColor *textViewDefaultLabelColor;
@property (weak, nonatomic) UILabel *characterLimitLabel;

@end


@implementation TWTextViewWithCharacterLimitLabelDelegate

- (instancetype)initWithCharacterLimitLabel:(UILabel *)characterLimitLabel maxLength:(NSInteger)maxLength attachToTextView:(UITextView *)textView
{
  AssertTrueOrReturnNil(characterLimitLabel);
  AssertTrueOrReturnNil(textView);
  
  self = [super init];
  if (self) {
    _textView = textView;
    _textViewDefaultLabelColor = _textView.textColor;
    _characterLimitLabel = characterLimitLabel;
    _maxLength = maxLength;
    
    if (_textView.delegate) {
      _fallbackDelegate = _textView.delegate;
    }
    _textView.delegate = self;
    [self tw_bindLifetimeTo:_textView];
  }
  return self;
}

#pragma mark - Method forwarding

- (id)forwardingTargetForSelector:(SEL)aSelector
{
  return self.fallbackDelegate;
}

- (BOOL)respondsToSelector:(SEL)aSelector
{
  BOOL respondsToSelector = [super respondsToSelector:aSelector];
  if (!respondsToSelector) {
    respondsToSelector = [self.fallbackDelegate respondsToSelector:aSelector];
  }
  return respondsToSelector;
}

#pragma mark - UITextViewDelegate

- (void)textViewDidChange:(UITextView *)textView
{
  self.remainingCharactersCount = (self.maxLength - textView.text.length);
  [self updateCharactersCountLabel];
  [self stateUpdatedCallback];
  [self updateTextColor];
  
  if ([self.fallbackDelegate respondsToSelector:@selector(textViewDidChange:)]) {
    [self.fallbackDelegate textViewDidChange:textView];
  }
}

- (void)updateCharactersCountLabel
{
  self.characterLimitLabel.text = [NSString stringWithFormat:@"%ld", (long)self.remainingCharactersCount];
  
  UIColor *labelColor;
  if ([self overCharacterLimit]) {
    labelColor = [UIColor redColor];
  } else {
    AssertTrueOrReturn(self.textViewDefaultLabelColor);
    labelColor = self.textViewDefaultLabelColor;
  }
  self.characterLimitLabel.textColor = labelColor;
}

- (void)stateUpdatedCallback
{
  BOOL overCharacterLimit = ([self overCharacterLimit]) && (self.textView.text.length > 0);
  if (overCharacterLimit != self.lastOverCharacterLimitValue) {
    self.lastOverCharacterLimitValue = overCharacterLimit;
    CallBlock(self.overCharacterLimitValueChanged, overCharacterLimit);
  }
}

#pragma mark - Accessors

- (UIColor *)textViewDefaultLabelColor
{
  if (_textViewDefaultLabelColor == nil) {
    _textViewDefaultLabelColor = [UIColor blackColor];
  }
  return _textViewDefaultLabelColor;
}

#pragma mark - Other methods

- (BOOL)overCharacterLimit
{
  return (self.remainingCharactersCount < 0);
}

- (void)updateTextStepRemainingCharactersCount
{
  [self textViewDidChange:self.textView];
}

- (void)updateTextColor
{
  UIColor *textColor = ([self overCharacterLimit] ? [UIColor redColor] : [UIColor blackColor]);
  if (self.textView.textColor != textColor) {
    self.textView.textColor = textColor;
  }
}

@end
