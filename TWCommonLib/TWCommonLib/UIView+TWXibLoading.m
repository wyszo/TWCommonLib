//
//  TWCommonLib
//

#import "UIView+TWXibLoading.h"
@import KZAsserts;

@implementation UIView (TWXibLoading)

+ (UIView *)tw_viewFromNibNamed:(NSString *)nibName withOwner:(UIView *)owner
{
  NSBundle *bundle = [NSBundle bundleForClass:[owner class]];
  UINib *nib = [UINib nibWithNibName:nibName bundle:bundle];
  const NSUInteger viewIndexInXib = 0;
  NSArray *nibViews = [nib instantiateWithOwner:owner options:nil];
  AssertTrueOrReturnNil(nibViews.count > viewIndexInXib);
  UIView *view = nibViews[viewIndexInXib];
  return view;
}

- (UIView *)tw_loadView:(UIView *)view fromNibNamed:(NSString *)nibName
{
  AssertTrueOrReturnNil(nibName.length);
  view = [UIView tw_viewFromNibNamed:nibName withOwner:self];
  view.frame = self.bounds;
  view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  [self addSubview:view];
  return view;
}

@end
