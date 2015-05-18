//
//  TWCommonLib
//

@import MapKit;
#include "TWCommonMacros.h"


@interface TWSimpleMapViewDelegate : NSObject <MKMapViewDelegate>

@property (nonatomic, copy) void (^annotationSelectedBlock)(id<MKAnnotation> annotation, BOOL isUserLocationAnnotation);
@property (nonatomic, copy) void (^annotationDeselectedBlock)(id<MKAnnotation> annotation);
@property (nonatomic, assign) BOOL allowUserLocationAnnotation;

NEW_AND_INIT_UNAVAILABLE
- (instancetype)initWithMapView:(MKMapView *)mapView;

@end
