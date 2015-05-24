//
//  TWCommonLib
//

#import "TWInterfaceOrientationClassStubs.h"
#import <KZAsserts.h>


#pragma mark - InterfaceOrientationClassStub

@implementation TWInterfaceOrientationClassStub

- (BOOL)shouldAutorotate
{
  AssertTrueOrReturnNo(0 && @"Base class, empty implementation");
  return NO;
}

- (NSUInteger)supportedInterfaceOrientations
{
  AssertTrueOr((0 && @"Base class, empty implementation"), return 0;);
  return 0;
}

@end

#pragma mark - InterfaceOrientationPortraitStub

@implementation TWInterfaceOrientationPortraitStub

- (BOOL)shouldAutorotate
{
  return NO;
}

- (NSUInteger)supportedInterfaceOrientations
{
  return UIInterfaceOrientationMaskPortrait;
}

@end

#pragma mark - InterfaceOrientationAllButUpsideDownStub

@implementation TWInterfaceOrientationAllButUpsideDownStub

- (BOOL)shouldAutorotate
{
  return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
  return UIInterfaceOrientationMaskAllButUpsideDown;
}

@end
