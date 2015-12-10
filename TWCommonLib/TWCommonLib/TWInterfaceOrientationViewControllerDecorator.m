//
//  TWCommonLib
//

@import KZAsserts;
#import "TWInterfaceOrientationViewControllerDecorator.h"
#import "TWInterfaceOrientationClassStubs.h"
#import "TWClassMethodCopyHelper.h"


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
  
  TWClassMethodCopyHelper *methodCopyHelper = [TWClassMethodCopyHelper new];
  
  [methodCopyHelper copyMethodFromClass:sourceClass withSelector:@selector(shouldAutorotate) toClass:aClass];
  [methodCopyHelper copyMethodFromClass:sourceClass withSelector:@selector(supportedInterfaceOrientations) toClass:aClass];
}

@end
