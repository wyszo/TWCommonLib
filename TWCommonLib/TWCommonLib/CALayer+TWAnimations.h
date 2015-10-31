//
//  TWCommonLib
//

@import QuartzCore;

@interface CALayer (TWAnimations)

- (void)tw_animateToPosition:(CGPoint)newPosition withDuration:(NSTimeInterval)duration;
- (void)tw_animateOpacityToValue:(CGFloat)toValue withDuration:(NSTimeInterval)duration;

@end
