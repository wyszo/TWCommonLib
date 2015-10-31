//
//  TWCommonLib
//

@import KZAsserts;
@import BlocksKit;
#import "UIViewController+TWNotificationObserving.h"
#import "TWCommonLib.h"

static NSString *const kBindingKey = @"NotificationsNameToSelectorMapping";


@implementation UIViewController (TWNotificationObserving)

- (void)tw_registerNotificationsWithNameToSelectorMapping:(NSDictionary *)mapping
{
  AssertTrueOrReturn(mapping.count);
  
  id alreadyAttachedObject = [self tw_getAttachedObjectWithKey:kBindingKey];
  if ([alreadyAttachedObject isEqualToDictionary:mapping]) {
    return; // same mapping already applied, do nothing
  }
  
  AssertTrueOrReturn(alreadyAttachedObject == nil && @"multiple executions of this method not supported yet");
  [self tw_registerNotificationsUsingMapping:mapping];
}

- (void)tw_registerNotificationsUsingMapping:(NSDictionary *)mapping
{
  AssertTrueOrReturn(mapping.count);
  
  [mapping bk_each:^(NSString *key, id obj) {
    SEL selector = [obj pointerValue];
    AssertTrueOrReturn(selector);
    [[NSNotificationCenter defaultCenter] addObserver:self selector:selector name:key object:nil];
  }];
  
  [mapping tw_bindLifetimeTo:self usingKey:kBindingKey];
}

- (void)tw_removeNotificationsWithNameToSelectorMapping:(NSDictionary *)mapping
{
  [mapping bk_each:^(NSString *key, id obj) {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:key object:nil];
  }];
}

- (void)tw_removeNotificationsRegisteredUsingMapping
{
  id mapping = [self tw_getAttachedObjectWithKey:kBindingKey];
  AssertTrueOrReturn(mapping);
  AssertTrueOrReturn([mapping isKindOfClass:[NSDictionary class]]);
  [self tw_releaseAttachedObjectFromOwner:self withKey:kBindingKey];
  [self tw_removeNotificationsWithNameToSelectorMapping:mapping];
}

@end
