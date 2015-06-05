//
//  TWCommonLib
//

#import "UIViewController+Navbar.h"


@implementation UIViewController (Navbar)

- (void)tw_setNavbarDoesNotCoverTheView
{
  self.edgesForExtendedLayout = UIRectEdgeNone;
  self.automaticallyAdjustsScrollViewInsets = NO;
}

@end
