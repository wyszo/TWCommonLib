//
//  TWCommonLib
//

@import KZAsserts;
#import "TWSimpleMapViewDelegate.h"

@interface TWSimpleMapViewDelegate ()
@property (nonatomic, weak) MKMapView *mapView;
@end

@implementation TWSimpleMapViewDelegate

#pragma mark - Object Lifecycle

- (instancetype)initWithMapView:(MKMapView *)mapView
{
  AssertTrueOrReturnNil(mapView);
  self = [super init];
  if (self) {
    _mapView = mapView;
    _allowUserLocationAnnotation = YES;
  }
  return self;
}

#pragma mark - MapViewDelegate methods

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view
{
  BOOL isUserLocationAnnotation = ([view.annotation isKindOfClass:[MKUserLocation class]]);
  
  CallBlock(self.annotationSelectedBlock, view.annotation, isUserLocationAnnotation);
}

- (void)mapView:(MKMapView *)mapView didDeselectAnnotationView:(MKAnnotationView *)view
{
  CallBlock(self.annotationDeselectedBlock, view.annotation);
}

- (void)mapView:(MKMapView *)mapView didAddAnnotationViews:(NSArray *)views
{
  [self updateUserLocationAnnotationCanShowCalloutForAnnotationViews:views];
}

- (void)setAllowUserLocationAnnotation:(BOOL)allowUserLocationAnnotation
{
  if (_allowUserLocationAnnotation != allowUserLocationAnnotation) {
    _allowUserLocationAnnotation = allowUserLocationAnnotation;
    
    MKAnnotationView *userLocationAnnotationView = [self annotationViewForUserLocation];
    if (userLocationAnnotationView) {
      [self updateUserLocationAnnotationCanShowCalloutForAnnotationViews:@[ userLocationAnnotationView ]];
    }
  }
}

#pragma mark - private methods

- (MKAnnotationView *)annotationViewForUserLocation
{
  __block MKAnnotationView *userAnnotationView;
  
  [self.mapView.annotations enumerateObjectsUsingBlock:^(id<MKAnnotation> annotation, NSUInteger idx, BOOL *stop) {
    if ([annotation isKindOfClass:[MKUserLocation class]]) {
      userAnnotationView = [self.mapView viewForAnnotation:annotation];
      *stop = YES;
    }
  }];
  return userAnnotationView;
}

- (void)updateUserLocationAnnotationCanShowCalloutForAnnotationViews:(NSArray *)annotationViews
{
  for (NSObject *object in annotationViews) {
    AssertTrueOrContinue([object isKindOfClass:[MKAnnotationView class]]);
    MKAnnotationView *annotationView = (MKAnnotationView *)object;
    
    if ([annotationView.annotation isKindOfClass:[MKUserLocation class]]) {
      annotationView.canShowCallout = self.allowUserLocationAnnotation;
      break;
    }
  }
}

@end
