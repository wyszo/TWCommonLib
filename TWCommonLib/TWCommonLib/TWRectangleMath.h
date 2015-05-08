//
//  TWCommonLib
//

@interface TWRectangleMath : NSObject

+ (CGPoint)centerPointOfRectangleWithSize:(CGSize)firstRectangleSize concentricWithRectangleWithSize:(CGSize)secondRectangleSize;

+ (CGSize)rectangleUnionSizeFromRectangleWithSize:(CGSize)firstRectangleSize andRectangleWithSize:(CGSize)secondRectangleSize;

@end
