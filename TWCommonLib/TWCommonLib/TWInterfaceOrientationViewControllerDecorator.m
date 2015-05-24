//
//  TWCommonLib
//

#import <objc/runtime.h>
#import <KZAsserts.h>
#import "TWInterfaceOrientationViewControllerDecorator.h"
#import "TWInterfaceOrientationClassStubs.h"


@implementation TWInterfaceOrientationViewControllerDecorator

- (void)addInterfaceOrientationMethodsToClass:(Class)aClass shouldAutorotate:(BOOL)shouldAutorotate
{
  AssertTrueOrReturn(aClass);
  Class sourceClass;
  
  if (shouldAutorotate) {
    sourceClass = [TWInterfaceOrientationAllButUpsideDownStub class];
  }
  else {
    sourceClass = [TWInterfaceOrientationPortraitStub class];
  }
  
  [self copyMethodFromClass:sourceClass withSelector:@selector(shouldAutorotate) toClass:aClass];
  [self copyMethodFromClass:sourceClass withSelector:@selector(supportedInterfaceOrientations) toClass:aClass];
}

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
