//
//  TWCommonLib
//

@import KZAsserts;
#import "TWLocationUpdatesManager.h"

static NSString *const kLocationWhenInUseUsageDescriptionKey = @"NSLocationWhenInUseUsageDescription";

@interface TWLocationUpdatesManager ()
@property (strong, nonatomic) CLLocationManager *locationManager;
@end

@implementation TWLocationUpdatesManager

#pragma mark - Public

- (instancetype)init
{
  self = [super init];
  if (self) {
    _locationManager = [[CLLocationManager alloc] init];
  }
  return self;
}

- (void)requestLocationUpdates
{
  [self initializeLocationManagerRequestLocationWhenAppInUse];
  [self checkInfoDictionaryContainsKeysRequiredByIOS8];
}

#pragma mark - Private

- (void)initializeLocationManagerRequestLocationWhenAppInUse
{
  CLLocationManager *locationManager = [[CLLocationManager alloc] init];
  if ([locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
    [locationManager requestWhenInUseAuthorization];
  }
  self.locationManager = locationManager;
}

- (void)checkInfoDictionaryContainsKeysRequiredByIOS8
{
  id locationDescription = [[[NSBundle mainBundle] infoDictionary] objectForKey:kLocationWhenInUseUsageDescriptionKey];
  AssertTrueOrReturn(locationDescription != nil);
  AssertTrueOrReturn([locationDescription isKindOfClass:[NSString class]]);
}

@end
