//
//  TWCommonLib
//

#import "NSObject+TWLazyInitialization.h"
#import "TWLazyInitializationProxy.h"


@implementation NSObject (TWLazyInitialization)

+ (instancetype)lazy
{
  return (id)[[TWLazyInitializationProxy alloc] initWithClass:self.class];
}

@end
