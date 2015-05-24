//
//  TWCommonLib
//

#import "TWLazyInitializationProxy.h"
#import <KZAsserts.h>


@interface TWLazyInitializationProxy ()

@property (nonatomic, strong) id object;
@property (nonatomic, strong) Class classToInstantiate;
@property (nonatomic, strong) NSInvocation *objectInitInvocation;

@end


@implementation TWLazyInitializationProxy

- (instancetype)initWithClass:(Class)aClass
{
  AssertTrueOrReturnNil(aClass);
  _classToInstantiate = aClass;
  return self;
}

- (void)instantiateObject
{
  AssertTrueOrReturn(self.classToInstantiate);
  self.object = [self.classToInstantiate alloc];
  
  if (!self.objectInitInvocation) {
    self.object = [self.object init];
  }
  else {
    [self.objectInitInvocation invokeWithTarget:self.object];
    [self.objectInitInvocation getReturnValue:&_object];
    self.objectInitInvocation = nil;
  }
}

#pragma mark - Forwarding

- (id)forwardingTargetForSelector:(SEL)selector
{
  if (!self.object) { // just need to set it once
    if (![self isInitSelector:selector]) {
      [self instantiateObject];
    }
  }
  return self.object;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)selector
{
  NSMethodSignature *signature = [self.classToInstantiate instanceMethodSignatureForSelector:selector];
  return signature;
}

#pragma mark - Auxiliary methods

- (BOOL)isInitSelector:(SEL)selector
{
  AssertTrueOrReturnNo(selector);
  return [NSStringFromSelector(selector) hasPrefix:@"init"];
}

- (void)instantiateObjectIfNil
{
  if (!self.object) {
    [self instantiateObject];
  }
}

#pragma mark - Init... methods

- (void)forwardInvocation:(NSInvocation *)invocation
{
  // The execution could have gotten here only via Init... method
  AssertTrueOrReturn([self isInitSelector:invocation.selector]);
  
  self.objectInitInvocation = invocation;
  [invocation setTarget:nil]; // not needed, we don't want to retain the target
  [invocation retainArguments];
  [invocation setReturnValue:(void *)&self];
}

#pragma mark - Forwarding NSProxy methods

- (Class)class
{
  [self instantiateObjectIfNil];
  return [self.object class];
}

- (Class)superclass
{
  [self instantiateObjectIfNil];
  return [self.object superclass];
}

- (BOOL)conformsToProtocol:(Protocol *)protocol
{
  [self instantiateObjectIfNil];
  return [self.object conformsToProtocol:protocol];
}

- (NSString *)description
{
  [self instantiateObjectIfNil];
  return [self.object description];
}

- (NSUInteger)hash
{
  [self instantiateObjectIfNil];
  return [self.object hash];
}

- (BOOL)isEqual:(id)object
{
  [self instantiateObjectIfNil];
  return [self.object isEqual:object];
}

- (BOOL)isKindOfClass:(Class)aClass
{
  [self instantiateObjectIfNil];
  return [self.object isKindOfClass:aClass];
}

- (BOOL)isMemberOfClass:(Class)aClass
{
  [self instantiateObjectIfNil];
  return [self.object isMemberOfClass:aClass];
}

- (BOOL)respondsToSelector:(SEL)selector
{
  [self instantiateObjectIfNil];
  return [self.object respondsToSelector:selector];
}

@end
