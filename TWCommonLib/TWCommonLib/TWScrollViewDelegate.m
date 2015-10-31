//
//  TWCommonLib
//

@import KZAsserts;
#import "TWScrollViewDelegate.h"

@implementation TWScrollViewDelegate

- (instancetype)initAttachingToScrollView:(UIScrollView *)scrollView
{
  AssertTrueOrReturnNil(scrollView);
  self = [super init];
  if (self) {
    scrollView.delegate = self;
  }
  return self;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
  CallBlock(self.didEndDeceleratingBlock);
}

@end
