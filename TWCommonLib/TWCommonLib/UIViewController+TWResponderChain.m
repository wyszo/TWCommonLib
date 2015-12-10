//
//  TWCommonLib
//

@import KZAsserts;
#import "UIViewController+TWResponderChain.h"

@implementation UIViewController (TWResponderChain)

- (void)tw_resignFirstResponder
{
  AssertTrueOrReturn(self.view);
  [self.view endEditing:YES];
}

@end
