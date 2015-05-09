//
//  TWCommonLib
//

@interface TWRectangleMath : NSObject

+ (CGPoint)topLeftPointOfRectangleWithSize:(CGSize)rectangleSize centerPoint:(CGPoint)center;

+ (CGPoint)topLeftPointOfRectangleWithSize:(CGSize)firstRectangleSize concentricWithRectangleWithSize:(CGSize)secondRectangleSize;

+ (CGSize)rectangleUnionSizeFromRectangleWithSize:(CGSize)firstRectangleSize andRectangleWithSize:(CGSize)secondRectangleSize;

@end
