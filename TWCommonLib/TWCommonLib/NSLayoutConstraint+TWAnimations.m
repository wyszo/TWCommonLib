//
//  TWCommonLib
//

#import "NSLayoutConstraint+TWAnimations.h"
#import "TWCommonMacros.h"

@implementation NSLayoutConstraint (TWAnimations)

- (void)animateToValue:(CGFloat)destinationValue onView:(UIView *)view withDuration:(NSTimeInterval)animationDuration {
    [self animateToValue:destinationValue onView:view withDuration:animationDuration completion:nil];
}

- (void)animateToValue:(CGFloat)destinationValue onView:(UIView *)view withDuration:(NSTimeInterval)animationDuration completion:(BlockWithBoolParameter)completion
{
    self.constant = destinationValue;
    
    [UIView animateWithDuration:animationDuration animations:^{
        [view layoutIfNeeded];
    } completion:^(BOOL finished) {
        CallBlock(completion, finished);
    }];
}

@end
