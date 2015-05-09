//
//  TWCommonLib
//

#import "TWAlertFactory.h"


@implementation TWAlertFactory

+ (UIAlertView *)blockingAlertWithTitle:(NSString *)title message:(NSString *)message
{
  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:nil otherButtonTitles:nil];
  [alert show];
  return alert;
}

@end
