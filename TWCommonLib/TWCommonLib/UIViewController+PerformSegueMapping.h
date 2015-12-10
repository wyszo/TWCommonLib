//
//  TWCommonLib
//

@import UIKit;

@interface UIViewController (PerformSegueMapping)

// TODO: add a description and example usage (via unit tests preferably)
// TODO: write another method that maps segue.destinationViewController to an instance property (based on the storyboardId)
- (void)performSelectorForSegue:(UIStoryboardSegue *)segue usingMapping:(NSDictionary *)mapping;

@end
