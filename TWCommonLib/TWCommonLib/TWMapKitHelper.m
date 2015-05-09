//
//  TWCommonLib
//

#import "TWMapKitHelper.h"

@implementation TWMapKitHelper

- (void)openMapsApplicationAndNavigateToCoordinate:(CLLocationCoordinate2D)coordinate
{
  MKPlacemark *placemark = [[MKPlacemark alloc] initWithCoordinate:coordinate addressDictionary:nil];
  MKMapItem *mapItem = [[MKMapItem alloc] initWithPlacemark:placemark];
  
  [mapItem openInMapsWithLaunchOptions:@{
                                         MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving
                                         }];
}

@end
