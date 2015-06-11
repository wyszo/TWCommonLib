//
//  TWCommonLib
//

#import "NSObject+TWLazyInitialization.h"
#import "TWLazyInitializationProxy.h"


@implementation NSObject (TWLazyInitialization)

+ (instancetype)tw_lazy
{
  return (id)[[TWLazyInitializationProxy alloc] initWithClass:self.class];
}

+ (instancetype)tw_lazyWithBlock:(id (^)())initBlock
{
  return (id)[[TWLazyInitializationProxy alloc] initWithClass:self.class initBlock:initBlock];
}

@end
