@import KZAsserts;
@import UIKit;
#import "TWKeyboardNotificationsManager.h"
#import "TWCommonMacros.h"

@interface TWKeyboardNotificationsManager()
@property (nonatomic, strong) NSMutableArray *notificationObservers;
@end

@implementation TWKeyboardNotificationsManager

- (instancetype)init
{
  self = [super init];
  if (self) {
    _notificationObservers = [NSMutableArray new];
  }
  return self;
}

- (void)dealloc {
  [self unregisterNotificationObservers];
}

#pragma mark - Keyboard notifications

- (void)setupKeyboardDidShowNotificationHandler:(void (^)(CGRect))handler {
  AssertTrueOrReturn(handler);
  [self registerNotificationObserverForName:UIKeyboardDidShowNotification withBlock:^(NSDictionary *userInfo){
    CGRect keyboardFrameRect = [userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue]; // note we don't use convertRect: in here, no need
    CallBlock(handler, keyboardFrameRect);
  }];
}

- (void)setupKeyboardWillHideNotificationHandler:(VoidBlock)handler {
  [self registerNotificationObserverForName:UIKeyboardWillHideNotification withBlock:^(NSDictionary *userInfo) {
    CallBlock(handler);
  }];
}

- (void)unregisterNotificationObservers {
  for (id observer in self.notificationObservers) {
    [[NSNotificationCenter defaultCenter] removeObserver:observer];
  }
  [self.notificationObservers removeAllObjects];
}

#pragma mark - Private

- (void)registerNotificationObserverForName:(nonnull NSString *)name withBlock:(nonnull VoidBlockWithDictionary)block {
  AssertTrueOrReturn(name.length > 0);
  AssertTrueOrReturn(block);
  
  id observer = [[NSNotificationCenter defaultCenter] addObserverForName:name object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {
    CallBlock(block, note.userInfo);
  }];
  [self.notificationObservers addObject:observer];
}

@end