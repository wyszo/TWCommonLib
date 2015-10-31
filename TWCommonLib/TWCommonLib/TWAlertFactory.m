//
//  TWCommonLib
//

@import KZAsserts;
#import "TWAlertFactory.h"
#import "UIAlertView+Blocks.h"
#import "TWCommonMacros.h"

@implementation TWAlertFactory

#pragma mark - Blocking alerts

+ (UIAlertView *)blockingAlertWithTitle:(NSString *)title message:(NSString *)message
{
  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:nil otherButtonTitles:nil];
  [alert show];
  return alert;
}

#pragma mark - Message alerts

+ (UIAlertView *)showAlertViewWithMessage:(NSString *)message
{
  AssertTrueOrReturnNil(message.length);
  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:message delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles: nil];
  [alert show];
  return alert;
}

#pragma mark - OK Alerts

+ (UIAlertView *)showOKAlertViewWithMessage:(NSString *)message
{
  return [self showOKAlertViewWithMessage:message okButtonTitle:@"OK"];
}

+ (UIAlertView *)showOKAlertViewWithMessage:(NSString *)message okButtonTitle:(NSString *)okTitle
{
  return [self showOKAlertViewWithMessage:message okButtonTitle:okTitle action:nil];
}

+ (UIAlertView *)showOKAlertViewWithMessage:(NSString *)message action:(VoidBlock)action
{
  return [self showOKAlertViewWithMessage:message okButtonTitle:@"OK" action:action];
}

+ (UIAlertView *)showOKAlertViewWithMessage:(NSString *)message okButtonTitle:(NSString *)okTitle action:(VoidBlock)action
{
  AssertTrueOrReturnNil(message.length);
  RIButtonItem *okButtonItem = [RIButtonItem itemWithLabel:okTitle action:action];
  
  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:message cancelButtonItem:okButtonItem otherButtonItems:nil];
  [alert show];
  return alert;
}

#pragma mark - Two button alerts

+ (UIAlertView *)showTwoButtonsAlertViewWithTitle:(NSString *)title message:(NSString *)message firstButtonTitle:(NSString *)firstButtonTitle firstButtonAction:(VoidBlock)firstAction secondButtonTitle:(NSString *)secondButtonTitle secondAction:(VoidBlock)secondAction
{
  AssertTrueOrReturnNil(message.length || title.length);
  AssertTrueOrReturnNil(firstButtonTitle.length);
  AssertTrueOrReturnNil(secondButtonTitle.length);
  
  RIButtonItem *firstButtonItem = [RIButtonItem itemWithLabel:firstButtonTitle action:^{
    CallBlock(firstAction);
  }];
  RIButtonItem *secondButtonItem = [RIButtonItem itemWithLabel:secondButtonTitle action:^{
    CallBlock(secondAction);
  }];
  
  UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:message cancelButtonItem:nil otherButtonItems:firstButtonItem, secondButtonItem, nil];
  [alertView show];
  return alertView;
}

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
