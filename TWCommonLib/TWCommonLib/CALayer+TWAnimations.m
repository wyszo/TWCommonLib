//
//  TWCommonLib
//

@import KZAsserts;
#import "CALayer+TWAnimations.h"

@implementation CALayer (TWAnimations)

- (void)tw_animateToPosition:(CGPoint)newPosition withDuration:(NSTimeInterval)duration {
    AssertTrueOrReturn(duration >= 0);
    
    [CATransaction begin];
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    animation.fromValue = [NSValue valueWithCGPoint:self.position];
    animation.toValue = [NSValue valueWithCGPoint:newPosition];
    animation.duration = duration;
    animation.repeatCount = 1;
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    
    [CATransaction setCompletionBlock:^{
        self.position = newPosition;
    }];
    [self addAnimation:animation forKey:animation.keyPath];
    [CATransaction commit];
}

- (void)tw_animateOpacityToValue:(CGFloat)toValue withDuration:(NSTimeInterval)duration {
    AssertTrueOrReturn(toValue >= 0 && toValue <= 1);
    AssertTrueOrReturn(duration >= 0);
    
    [CATransaction begin];
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    animation.fromValue = [NSNumber numberWithFloat:self.opacity];
    animation.toValue = [NSNumber numberWithFloat:toValue];
    animation.duration = duration;
    animation.repeatCount = 1;
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    
    [CATransaction setCompletionBlock:^{
        self.opacity = toValue;
    }];
    [self addAnimation:animation forKey:animation.keyPath];
    [CATransaction commit];
}

@end
