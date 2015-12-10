//
//  TWCommonLib
//

NS_ASSUME_NONNULL_BEGIN

@interface UIView (TWLayerDecoration)

- (void)tw_addBorderWithWidth:(CGFloat)borderWidth color:(UIColor *)borderColor;
- (void)tw_addTopBorderWithWidth:(CGFloat)borderWidth color:(UIColor *)borderColor;

- (void)tw_setCornerRadius:(CGFloat)cornerRadius;

@end

NS_ASSUME_NONNULL_END
