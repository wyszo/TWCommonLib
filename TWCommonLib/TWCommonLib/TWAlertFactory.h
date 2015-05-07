//
//  TWCommonLib
//

/**
 Disclaimer: This class uses obsolete UIAlertView instead of new UIActionController (for iOS7 compatibility)
 */
@interface TWAlertFactory : NSObject

+ (UIAlertView *)blockingAlertWithTitle:(NSString *)title message:(NSString *)message;

@end
