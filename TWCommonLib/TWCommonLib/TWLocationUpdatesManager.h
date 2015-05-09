//
//  TWCommonLib
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>


/**
 Use this class instead of CLLocationManger directly - it'll warn you if you didn't extend Info.plist with required keys (iOS8) and also requestWhenInUseAuthorisation is wrapped in respondsToSelector calls (also for pre-iOS8 compatibility). 
 */
@interface TWLocationUpdatesManager : NSObject

@property (strong, nonatomic, readonly) CLLocationManager *locationManager;

- (void)requestLocationUpdates;

@end
