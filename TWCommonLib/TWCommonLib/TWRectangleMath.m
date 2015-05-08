//
//  TWCommonLib
//

#import "TWRectangleMath.h"


@implementation TWRectangleMath

+ (CGPoint)topLeftPointOfRectangleWithSize:(CGSize)firstRectangleSize concentricWithRectangleWithSize:(CGSize)secondRectangleSize
{
  CGSize unionRectangleSize = [self rectangleUnionSizeFromRectangleWithSize:firstRectangleSize andRectangleWithSize:secondRectangleSize];
  CGFloat x = (unionRectangleSize.width - firstRectangleSize.width) / 2.0;
  CGFloat y = (unionRectangleSize.height - firstRectangleSize.height) / 2.0;
  CGPoint firstRectangleCenterForCombinedSize = CGPointMake(x, y);
  return firstRectangleCenterForCombinedSize;
}

+ (CGSize)rectangleUnionSizeFromRectangleWithSize:(CGSize)firstRectangleSize andRectangleWithSize:(CGSize)secondRectangleSize
{
  CGFloat unionSizeWidth = MAX(firstRectangleSize.width, secondRectangleSize.width);
  CGFloat unionSizeHeight = MAX(firstRectangleSize.height, secondRectangleSize.height);
  CGSize unionSize = CGSizeMake(unionSizeWidth, unionSizeHeight);
  return unionSize;
}

@end
