//
//  TWCommonLib
//

@interface TWCoordinateSystemConverter : NSObject

+ (CGPoint)convertPoint:(CGPoint)point fromCoordinateSystemWithSize:(CGSize)coordinateSystemSize toCoordinateSystemWithSize:(CGSize)destinationSystemSize;

+ (CGSize)convertSize:(CGSize)size fromCoordinateSystemWithSize:(CGSize)coordinateSystemSize toCoordinateSystemWithSize:(CGSize)destinationSystemSize;

@end
