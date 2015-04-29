//
//  PlayerAid
//

#import "UIView+TWFadeAnimations.h"


@implementation UIView (TWFadeAnimations)

- (void)tw_fadeInAnimationWithDuration:(NSTimeInterval)duration
{
  [self tw_fadeInAnimationWithDuration:duration completion:nil];
}

- (void)tw_fadeInAnimationWithDuration:(NSTimeInterval)duration completion:(void (^)(BOOL finished))completion
{
  if (duration == 0.0f) {
    return;
  }
  self.alpha = 0.0f;
  self.hidden = NO;
  
  UIViewAnimationOptions *animationOptions = (UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionAllowUserInteraction);
  
  [UIView animateWithDuration:duration delay:0 options:animationOptions animations:^{
    self.alpha = 1.0f;
  } completion:completion];
}

- (void)tw_fadeOutAnimationWithDuration:(NSTimeInterval)duration
{
  [self tw_fadeOutAnimationWithDuration:duration completion:nil];
}

- (void)tw_fadeOutAnimationWithDuration:(NSTimeInterval)duration completion:(void (^)(BOOL finished))completion
{
  if (duration == 0.0f) {
    return;
  }
  
  UIViewAnimationOptions *animationOptions = (UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionAllowUserInteraction);
  
  [UIView animateWithDuration:duration delay:0 options:animationOptions animations:^{
    self.alpha = 0.0f;
  } completion:^(BOOL finished) {
    self.hidden = YES;
    if (completion) {
      completion(finished);
    }
  }];
}

@end
