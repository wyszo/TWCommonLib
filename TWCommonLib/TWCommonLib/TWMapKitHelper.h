//
//  TWCommonLib
//

@import MapKit;

@interface TWMapKitHelper : NSObject

/**
 For now it selects 'driving' locations by default, regardless of the distance to the destination
 */
- (void)openMapsApplicationAndNavigateToCoordinate:(CLLocationCoordinate2D)coordinate;

@end
