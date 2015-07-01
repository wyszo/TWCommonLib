//
//  TWCommonLib
//

#import "TWAlertFactory.h"
#import "UIAlertView+Blocks.h"
#import "KZAsserts.h"
#import "TWCommonMacros.h"


@implementation TWAlertFactory

#pragma mark - Blocking alerts

+ (UIAlertView *)blockingAlertWithTitle:(NSString *)title message:(NSString *)message
{
  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:nil otherButtonTitles:nil];
  [alert show];
  return alert;
}

#pragma mark - Two button alerts

+ (UIAlertView *)showTwoButtonsAlertViewWithTitle:(NSString *)title message:(NSString *)message secondaryButtonTitle:(NSString *)cancelTitle action:(void (^)())cancelAction defaultButtonTitle:(NSString *)okTitle action:(void (^)())okAction
{
  AssertTrueOrReturnNil(message.length || title.length);
  
  NSString *cancelTitleText = @"Cancel";
  if (cancelTitle.length) {
    cancelTitleText = cancelTitle;
  }
  RIButtonItem *cancelButtonItem = [RIButtonItem itemWithLabel:cancelTitleText action:^{
    CallBlock(cancelAction);
  }];
  
  NSString *okTitleText = @"OK";
  if (okTitleText.length) {
    okTitleText = okTitle;
  }
  RIButtonItem *okButtonItem = [RIButtonItem itemWithLabel:okTitleText action:^{
    CallBlock(okAction);
  }];
  
  UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:message cancelButtonItem:cancelButtonItem otherButtonItems:okButtonItem, nil];
  [alertView show];
  return alertView;
}

@end
