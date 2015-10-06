//
//  TWCommonLib
//

#import "UIViewController+TWResponderChain.h"
#import <KZAsserts/KZAsserts.h>

@implementation UIViewController (TWResponderChain)

- (void)tw_resignFirstResponder
{
  AssertTrueOrReturn(self.view);
  [self.view endEditing:YES];
}

@end
