//
//  TWCommonLib
//

#import "TWCoordinateSystemConverter.h"

@implementation TWCoordinateSystemConverter

+ (CGPoint)convertPoint:(CGPoint)point fromCoordinateSystemWithSize:(CGSize)coordinateSystemSize toCoordinateSystemWithSize:(CGSize)destinationSystemSize
{
  CGFloat x = point.x * destinationSystemSize.width / coordinateSystemSize.width;
  CGFloat y = point.y * destinationSystemSize.height / coordinateSystemSize.height;
  CGPoint pointInDestinationCoordinateSystem = CGPointMake(x, y);
  return pointInDestinationCoordinateSystem;
}

+ (CGSize)convertSize:(CGSize)size fromCoordinateSystemWithSize:(CGSize)coordinateSystemSize toCoordinateSystemWithSize:(CGSize)destinationSystemSize
{
  CGFloat width = size.width * destinationSystemSize.width / coordinateSystemSize.width;
  CGFloat height = size.height * destinationSystemSize.height / coordinateSystemSize.height;
  CGSize sizeInDestinationCoordinates = CGSizeMake(width, height);
  return sizeInDestinationCoordinates;
}

@end
