//
//  TWCommonLib
//

@import CoreMotion;
@import KZAsserts;
#import "TWOrientationChangeDetectorUsingAccelerometer.h"
#import "TWCommonMacros.h"

const CGFloat kAccelerometerUpdateInterval = .2;

@interface TWOrientationChangeDetectorUsingAccelerometer()
@property (nonatomic, assign) UIInterfaceOrientation lastInterfaceOrientation;
@property (nonatomic, strong) CMMotionManager *motionManager;
@end

@implementation TWOrientationChangeDetectorUsingAccelerometer
@synthesize delegate;

- (instancetype)init
{
  if (self = [super init]) {
    _lastInterfaceOrientation = UIInterfaceOrientationPortrait;
  }
  return self;
}

- (void)dealloc
{
  [self stopDetectingOrientationChanges];
}

#pragma mark - Public interface 

- (void)startDetectingOrientationChanges
{
  [self.motionManager startAccelerometerUpdatesToQueue:[NSOperationQueue currentQueue] withHandler:^(CMAccelerometerData *accelerometerData, NSError *error) {
    AssertTrueOrReturn(!error);
    [self accelerometerDidUpdateWithData:accelerometerData];
  }];
}

- (void)stopDetectingOrientationChanges
{
  [self.motionManager stopAccelerometerUpdates];
}

#pragma mark - Accelerometer handling

- (void)accelerometerDidUpdateWithData:(CMAccelerometerData *)accelerometerData
{
  UIInterfaceOrientation orientation = [self interfaceOrientationFromAcceleration:accelerometerData.acceleration];
  
  if (orientation == self.lastInterfaceOrientation || orientation == UIInterfaceOrientationUnknown) {
    return;
  }
  else {
    self.lastInterfaceOrientation = orientation;
    [self callDelegateMethods];
  }
}

- (UIInterfaceOrientation)interfaceOrientationFromAcceleration:(CMAcceleration)acceleration
{
  UIInterfaceOrientation orientation;
  CGFloat threshold = 0.75;
  
  if (acceleration.x >= threshold) {
    orientation = UIInterfaceOrientationLandscapeLeft;
  }
  else if (acceleration.x <= -threshold) {
    orientation = UIInterfaceOrientationLandscapeRight;
  }
  else if (acceleration.y <= -threshold) {
    orientation = UIInterfaceOrientationPortrait;
  }
  else if (acceleration.y >= threshold) {
    orientation = UIInterfaceOrientationPortraitUpsideDown;
  }
  else {
    orientation = UIInterfaceOrientationUnknown; // same orientation as the last time
  }
  return orientation;
}

- (void)callDelegateMethods
{
  if (UIInterfaceOrientationIsPortrait(self.lastInterfaceOrientation)) {
    if ([delegate respondsToSelector:@selector(orientationDidChangeToPortrait)]) {
      [delegate orientationDidChangeToPortrait];
    }
  }
  else if (UIInterfaceOrientationIsLandscape(self.lastInterfaceOrientation)) {
    if ([delegate respondsToSelector:@selector(orientationDidChangeToLandscape)]) {
      [delegate orientationDidChangeToLandscape];
    }
  }
}

#pragma mark - Lazy initialization

- (CMMotionManager *)motionManager
{
  if (!_motionManager) {
    _motionManager = [[CMMotionManager alloc] init];
    _motionManager.accelerometerUpdateInterval = kAccelerometerUpdateInterval;
  }
  return _motionManager;
}

@end
