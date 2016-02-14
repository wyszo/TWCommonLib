//
//  TWCommonLib
//

@import UIKit;
#import "TWCommonTypes.h"

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

- (void)tw_registerNotificationObserverWithName:(nonnull NSString *)name handler:(nonnull VoidBlockWithDictionary)block;

@end
