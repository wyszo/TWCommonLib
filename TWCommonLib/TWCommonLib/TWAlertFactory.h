//
//  TWCommonLib
//

#import "TWCommonTypes.h"


/**
 Disclaimer: This class uses obsolete UIAlertView instead of new UIActionController (for iOS7 compatibility)
 */
@interface TWAlertFactory : NSObject

+ (UIAlertView *)blockingAlertWithTitle:(NSString *)title message:(NSString *)message;

/**
 Message alert with 'Dismiss' button (and no callback action)
 */
+ (UIAlertView *)showAlertViewWithMessage:(NSString *)message;

+ (UIAlertView *)showOKAlertViewWithMessage:(NSString *)message;
+ (UIAlertView *)showOKAlertViewWithMessage:(NSString *)message okButtonTitle:(NSString *)okTitle;

// Two button alerts

+ (UIAlertView *)showTwoButtonsAlertViewWithTitle:(NSString *)title message:(NSString *)message firstButtonTitle:(NSString *)firstButtonTitle firstButtonAction:(VoidBlock)firstAction secondButtonTitle:(NSString *)secondButtonTitle secondAction:(VoidBlock)secondAction;

+ (UIAlertView *)showTwoButtonsAlertViewWithTitle:(NSString *)title message:(NSString *)message secondaryButtonTitle:(NSString *)cancelTitle action:(void (^)())cancelAction defaultButtonTitle:(NSString *)okTitle action:(void (^)())okAction;

@end
