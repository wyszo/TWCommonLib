//
//  TWCommonLib
//

@import KZAsserts;
@import FLKAutoLayout;
#import "TWFullscreenActivityIndicatorView.h"

static const CGFloat kDefaultBackgroundAlphaValue = 0.5f;

@interface TWFullscreenActivityIndicatorView ()
@property (nonatomic, strong) UIActivityIndicatorView *activityIndicator;
@end

@implementation TWFullscreenActivityIndicatorView

#pragma mark - Init

- (instancetype)init
{
  CGRect frame = [UIScreen mainScreen].bounds;
  self = [super initWithFrame:frame];
  if (self) {
    [self setupWithFrame:frame];
  }
  return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
  if (self) {
    [self setupWithFrame:frame];
  }
  return self;
}

#pragma mark - view setup

- (void)setupWithFrame:(CGRect)frame
{
  AssertTrueOrReturn(CGRectEqualToRect(frame, CGRectZero) == NO);
  
  self.frame = frame;
  [self setBackgroundAlpha:kDefaultBackgroundAlphaValue];
  
  self.activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
  [self addSubview:self.activityIndicator];
  [self.activityIndicator alignCenterWithView:self];
  [self.activityIndicator startAnimating];
}

#pragma mark - Customization

- (void)setBackgroundAlpha:(CGFloat)backgroundAlpha
{
  AssertTrueOrReturn(backgroundAlpha >= 0.0f && backgroundAlpha <= 1.0f);
  
  if (_backgroundAlpha != backgroundAlpha) {
    _backgroundAlpha = backgroundAlpha;
    self.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:backgroundAlpha];
  }
}

#pragma mark - Public

- (void)dismiss
{
  [self.activityIndicator stopAnimating];
  [self removeFromSuperview];
}

@end
