//
//  TWCommonLib
//

#import "NSLayoutConstraint+ConstraintCopying.h"


@implementation NSLayoutConstraint (ConstraintCopying)

- (NSLayoutConstraint *)constraintCopyWithRelation:(NSLayoutRelation)relation
{
  return [NSLayoutConstraint constraintWithItem:self.firstItem attribute:self.firstAttribute relatedBy:relation toItem:self.secondItem attribute:self.secondAttribute multiplier:self.multiplier constant:self.constant];
}

@end
