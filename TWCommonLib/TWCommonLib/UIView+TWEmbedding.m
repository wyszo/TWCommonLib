//
//  TWCommonLib
//

#import "UIView+TWEmbedding.h"


@implementation UIView (TWEmbedding)

- (UIView *)tw_wrapInAContainerViewWithFrame:(CGRect)frame
{
  UIView *containerView = [[UIView alloc] initWithFrame:frame];
  containerView.backgroundColor = [UIColor whiteColor];
  [containerView addSubview:self];
  return containerView;
}

@end
