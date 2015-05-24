//
//  TWCommonLib
//

#import "TWUserDefaultsHelper.h"
#import "NSObject+TWLazyInitialization.h"
#import <KZAsserts.h>


@interface TWUserDefaultsHelper ()
@property (nonatomic, strong) NSUserDefaults *userDefaults;
@end


@implementation TWUserDefaultsHelper

- (instancetype)init
{
  self = [super init];
  if (self) {
    _userDefaults = [NSUserDefaults tw_lazyWithBlock:^id{
      return [NSUserDefaults standardUserDefaults];
    }];
  }
  return self;
}

- (void)setObject:(id)object forKeyAndSave:(NSString *)key
{
  AssertTrueOrReturn(object);
  AssertTrueOrReturn(key.length);

  [self.userDefaults setObject:object forKey:key];
  [self.userDefaults synchronize];
}

- (id)getObjectForKey:(NSString *)key
{
  AssertTrueOrReturnNil(key.length);
  return [self.userDefaults objectForKey:key];
}

@end
