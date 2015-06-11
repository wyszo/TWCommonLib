//
//  TWCommonLib
//


@interface UIView (TWXibLoading)

+ (UIView *)tw_viewFromNibNamed:(NSString *)nibName withOwner:(UIView *)owner;

- (void)tw_loadView:(UIView *)view fromNibNamed:(NSString *)nibName;

@end
