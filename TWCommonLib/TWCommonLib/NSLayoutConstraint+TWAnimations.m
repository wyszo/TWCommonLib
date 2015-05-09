//
//  TWCommonLib
//

#import "NSLayoutConstraint+TWAnimations.h"


@implementation NSLayoutConstraint (TWAnimations)

- (void)animateToValue:(CGFloat)destinationValue onView:(UIView *)view withDuration:(NSTimeInterval)animationDuration
{
  self.constant = destinationValue;
  
  [UIView animateWithDuration:animationDuration animations:^{
    [view layoutIfNeeded];
  }];
}

@end
