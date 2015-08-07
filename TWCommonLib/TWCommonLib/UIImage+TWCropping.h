//
//  TWCommonLib
//

@interface UIImage (TWCropping)

- (UIImage *)tw_imageByCroppingCenterToSquare;
- (UIImage *)tw_imageByCroppingCenterToSquareWithCenterPointOffset:(CGPoint)offset;

@end
