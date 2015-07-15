//
//  TWCommonLib
//

#import "NSObject+TWObjectLifetime.h"
#import <objc/runtime.h>
#import <KZAsserts.h>
#import "TWCommonMacros.h"


@implementation NSObject (TWObjectLifetime)

- (void)tw_bindLifetimeTo:(NSObject *)owner
{
  SEL selector = self.tw_associatedObjectDefaultKey;
  [self tw_bindLifetimeTo:owner usingKey:NSStringFromSelector(selector)];
}

- (void)tw_bindLifetimeTo:(NSObject *)owner usingKey:(NSString *)key
{
  AssertTrueOrReturn(owner);
  AssertTrueOrReturn(key);
  
  NSMutableArray *attachedObjects = [self elementsAttachedTo:owner];
  AssertTrueOrReturn(attachedObjects);
  
  if ([attachedObjects containsObject:self]) {
    return;
  }
  
  [attachedObjects addObject:self];
  objc_setAssociatedObject(owner, (__bridge const void *)(key), attachedObjects, OBJC_ASSOCIATION_RETAIN);
}

- (void)tw_releaseLifetimeDependencyFrom:(NSObject *)owner
{
  AssertTrueOrReturn(owner);
  NSMutableArray *attachedObjects = [self elementsAttachedTo:owner];
  AssertTrueOrReturn(attachedObjects.count > 0);
  AssertTrueOrReturn([attachedObjects containsObject:self]);
  
  [attachedObjects removeObject:self];
  objc_setAssociatedObject(owner, self.tw_associatedObjectDefaultKey, attachedObjects, OBJC_ASSOCIATION_RETAIN);
}

- (id)tw_getAttachedObjectWithKey:(NSString *)key
{
    AssertTrueOrReturnNil(key.length);
    NSArray *results = objc_getAssociatedObject(self, (__bridge const void *)(key));
    AssertTrueOrReturnNil(results.count <= 1 && @"no support for returning multiple objects yet");
    return results[0];
}

- (void)tw_releaseAttachedObjectFromOwner:(nonnull NSObject *)owner withKey:(nonnull NSString *)key
{
  NOT_IMPLEMENTED_YET_RETURN;
}

#pragma mark - Auxiliary methods

- (NSMutableArray *)elementsAttachedTo:(NSObject *)owner
{
  id value = objc_getAssociatedObject(owner, self.tw_associatedObjectDefaultKey);
  AssertTrueOrReturnNil(value == nil || [value isKindOfClass:[NSMutableArray class]]);
  
  if (!value) {
    value = [NSMutableArray new];
  }
  return value;
}

- (SEL)tw_associatedObjectDefaultKey
{
  return _cmd; // selectors are unique and constant, _cmd can be used as an associated object key
}

@end
