//
//  TWCommonLib
//

@import UIKit;

@interface UIViewController (TWNotificationObserving)

/**
 @param mapping   Dictionary with notification names as keys and boxed selectors (using BoxPointer macro) as values

 // TODO: extend to allow blocks to call as dictionary values!
 
 Example usage:
 [viewController tw_registerNotificationsWithNameToSelectorMapping:@{
    UIKeyboardWillShowNotification : BoxPointer(@selector(keyboardWillShow:)),
 }];
 */
- (void)tw_registerNotificationsWithNameToSelectorMapping:(NSDictionary *)mapping;

- (void)tw_removeNotificationsWithNameToSelectorMapping:(NSDictionary *)mapping;
- (void)tw_removeNotificationsRegisteredUsingMapping;

@end
