//
//  TWCommonLib
//

/**
 Disclaimer: This class uses obsolete UIAlertView instead of new UIActionController (for iOS7 compatibility)
 */
@interface TWAlertFactory : NSObject

+ (UIAlertView *)blockingAlertWithTitle:(NSString *)title message:(NSString *)message;

+ (UIAlertView *)showTwoButtonsAlertViewWithTitle:(NSString *)title message:(NSString *)message secondaryButtonTitle:(NSString *)cancelTitle action:(void (^)())cancelAction defaultButtonTitle:(NSString *)okTitle action:(void (^)())okAction;

@end
