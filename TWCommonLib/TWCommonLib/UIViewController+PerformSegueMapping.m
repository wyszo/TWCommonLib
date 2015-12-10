//
//  TWCommonLib
//

@import KZAsserts;
#import "UIViewController+PerformSegueMapping.h"
#import "TWCommonMacros.h"

@implementation UIViewController (PerformSegueMapping)

- (void)performSelectorForSegue:(UIStoryboardSegue *)segue usingMapping:(NSDictionary *)mapping
{
  AssertTrueOrReturn(segue);
  AssertTrueOrReturn(mapping.count);
  
  NSString *methodString = mapping[segue.identifier];
  AssertTrueOrReturn(methodString.length > 0);
  
  SuppressPerformSelectorLeakWarning(
    [self performSelector:NSSelectorFromString(methodString) withObject:segue.destinationViewController];
  );
}

@end
