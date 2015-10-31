//
//  TWCommonLib
//

#import "TWExtendedMPMoviePlayerViewController.h"

@implementation TWExtendedMPMoviePlayerViewController

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
  if (self.presentInLandscapeOrientation) {
    return UIInterfaceOrientationLandscapeRight;
  }
  return [[UIApplication sharedApplication] statusBarOrientation];
}

@end
