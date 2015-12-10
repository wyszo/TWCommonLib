//
//  TWCommonLib
//

@import UIKit;

@interface UIView (TWXibLoading)

+ (UIView *)tw_viewFromNibNamed:(NSString *)nibName withOwner:(UIView *)owner;

// Return value can be safely ignored, the view has already been added
- (UIView *)tw_loadView:(UIView *)view fromNibNamed:(NSString *)nibName;

@end
