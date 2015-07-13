//
//  TWCommonLib
//

#import "UIViewController+TWNotificationObserving.h"
#import <KZAsserts.h>
#import <BlocksKit.h>
#import "TWCommonLib.h"

static NSString *const kBindingKey = @"NotificationsNameToSelectorMapping";


@implementation UIViewController (TWNotificationObserving)

- (void)tw_registerNotificationsWithNameToSelectorMapping:(NSDictionary *)mapping
{
  AssertTrueOrReturn(mapping.count);
  [self tw_registerNotificationsUsingMapping:mapping];
  
  id alreadyAttachedObject = [self tw_getAttachedObjectWithKey:kBindingKey];
  AssertTrueOrReturn(alreadyAttachedObject == nil && @"multiple executions of this method not supported yet");
  
  [mapping tw_bindLifetimeTo:self usingKey:kBindingKey];
}

- (void)tw_registerNotificationsUsingMapping:(NSDictionary *)mapping
{
  AssertTrueOrReturn(mapping.count);
  
  [mapping bk_each:^(NSString *key, id obj) {
    SEL selector = [obj pointerValue];
    AssertTrueOrReturn(selector);
    [[NSNotificationCenter defaultCenter] addObserver:self selector:selector name:key object:nil];
  }];
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
  [self tw_removeNotificationsWithNameToSelectorMapping:mapping];
}

@end
