//
//  TWCommonLib
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>


@interface TWLocationUpdatesManager : NSObject

@property (strong, nonatomic, readonly) CLLocationManager *locationManager;

- (void)requestLocationUpdates;

@end
