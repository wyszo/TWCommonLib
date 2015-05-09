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
  NSMutableArray *attachedObjects = [self elementsAttachedTo:owner];
  AssertTrueOrReturn(attachedObjects);
  
  if ([attachedObjects containsObject:self]) {
    return;
  }
  
  [attachedObjects addObject:self];
  objc_setAssociatedObject(owner, self.tw_associatedObjectKey, attachedObjects, OBJC_ASSOCIATION_RETAIN);
}

- (void)tw_releaseLifetimeDependencyFrom:(NSObject *)owner
{
  AssertTrueOrReturn(owner);
  NSMutableArray *attachedObjects = [self elementsAttachedTo:owner];
  AssertTrueOrReturn(attachedObjects.count > 0);
  AssertTrueOrReturn([attachedObjects containsObject:self]);
  
  [attachedObjects removeObject:self];
  objc_setAssociatedObject(owner, self.tw_associatedObjectKey, attachedObjects, OBJC_ASSOCIATION_RETAIN);
}

#pragma mark - Auxiliary methods

- (NSMutableArray *)elementsAttachedTo:(NSObject *)owner
{
  id value = objc_getAssociatedObject(owner, self.tw_associatedObjectKey);
  AssertTrueOrReturnNil(value == nil || [value isKindOfClass:[NSMutableArray class]]);
  
  if (!value) {
    value = [NSMutableArray new];
  }
  return value;
}

- (SEL)tw_associatedObjectKey
{
  return _cmd; // selectors are unique and constant, _cmd can be used as an associated object key
}

@end
