//
//  PlayerAid
//

@interface UIView (TWFadeAnimations)

- (void)tw_fadeInAnimationWithDuration:(NSTimeInterval)duration;
- (void)tw_fadeInAnimationWithDuration:(NSTimeInterval)duration completion:(void (^)(BOOL finished))completion;

- (void)tw_fadeOutAnimationWithDuration:(NSTimeInterval)duration;
- (void)tw_fadeOutAnimationWithDuration:(NSTimeInterval)duration completion:(void (^)(BOOL finished))completion;

@end
