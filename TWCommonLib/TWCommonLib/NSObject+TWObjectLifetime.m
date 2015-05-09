//
//  TWCommonLib
//

#import "NSObject+TWObjectLifetime.h"
#import <objc/runtime.h>
#import <KZAsserts.h>


@implementation NSObject (TWObjectLifetime)

- (void)tw_bindLifetimeTo:(NSObject *)owner
{
  AssertTrueOrReturn(owner);
  objc_setAssociatedObject(owner, self.tw_associatedObjectKey, self, OBJC_ASSOCIATION_RETAIN);
}

- (void)tw_releaseLifetimeDependencyFrom:(NSObject *)owner
{
  objc_setAssociatedObject(owner, self.tw_associatedObjectKey, nil, OBJC_ASSOCIATION_RETAIN);
}

- (SEL)tw_associatedObjectKey
{
  return _cmd; // selectors are unique and constant, can be used as associated object key
}

@end
