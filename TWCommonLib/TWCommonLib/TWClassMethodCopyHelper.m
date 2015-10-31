//
//  TWCommonLib
//

@import KZAsserts;
#import "TWClassMethodCopyHelper.h"
#import <objc/runtime.h>

@implementation TWClassMethodCopyHelper

- (void)copyMethodFromClass:(Class)sourceClass withSelector:(SEL)selector toClass:destinationClass
{
  AssertTrueOrReturn(sourceClass);
  AssertTrueOrReturn(selector);
  AssertTrueOrReturn(destinationClass);
  
  Method method = class_getInstanceMethod(sourceClass, selector);
  IMP imp = method_getImplementation(method);
  const char *methodTypeEncoding = method_getTypeEncoding(method);
  
  class_addMethod(destinationClass, selector, imp, methodTypeEncoding);
}

@end
