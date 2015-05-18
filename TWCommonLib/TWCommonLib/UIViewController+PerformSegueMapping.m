//
//  TWCommonLib
//

#import "UIViewController+PerformSegueMapping.h"
#import "TWCommonMacros.h"
#import <KZAsserts.h>


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
