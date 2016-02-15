@import Foundation;
#import "TWCommonTypes.h"

// notifications will be automatically unregistered when this object gets deallocated
@interface TWKeyboardNotificationsManager : NSObject

- (void)setupKeyboardDidShowNotificationHandler:(void (^)(CGRect))handler;
- (void)setupKeyboardWillHideNotificationHandler:(VoidBlock)handler;

- (void)unregisterNotificationObservers; // only required if notifications are supposed to be removed before manager dealloc 

@end