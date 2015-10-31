//
//  TWCommonLib
//

#import "TWCommonTypes.h"

@interface NSLayoutConstraint (TWAnimations)

- (void)animateToValue:(CGFloat)destinationValue onView:(UIView *)view withDuration:(NSTimeInterval)animationDuration;
- (void)animateToValue:(CGFloat)destinationValue onView:(UIView *)view withDuration:(NSTimeInterval)animationDuration completion:(BlockWithBoolParameter)completion;

@end
