//
//  TWCommonLib
//

#import "TWOrientationChangeDetector.h"

@interface TWOrientationChangeDetector ()
@property (nonatomic, assign) UIInterfaceOrientation lastInterfaceOrientation;
@end

@implementation TWOrientationChangeDetector
@synthesize delegate;

#pragma mark - Initialization

- (id)init
{
  self = [super init];
  if (self) {
    _lastInterfaceOrientation = [[UIApplication sharedApplication] statusBarOrientation];
    [self updateInterfaceOrientation];
  }
  return self;
}

- (void)dealloc
{
  [self resignFromOrientationChangeNotification];
}

#pragma mark - Orientation

- (void)updateInterfaceOrientation
{
  self.lastInterfaceOrientation = [self interfaceOrientation];
}

- (UIInterfaceOrientation)interfaceOrientation
{
  UIDeviceOrientation deviceOrientation = [UIDevice currentDevice].orientation;
  if (deviceOrientation != UIDeviceOrientationUnknown && deviceOrientation != UIDeviceOrientationFaceUp && deviceOrientation != UIDeviceOrientationFaceDown) {
    // TODO: Technical debt: make this casting safer!
    return (UIInterfaceOrientation)[UIDevice currentDevice].orientation;
  }
  
  return self.lastInterfaceOrientation;
}

#pragma mark - Public interface

- (void)startDetectingOrientationChanges
{
  [self updateInterfaceOrientation];
  [self registerForOrientationChangeNotification];
}

- (void)stopDetectingOrientationChanges
{
  [self resignFromOrientationChangeNotification];
}

#pragma mark - Notification handling

- (NSString *)orientationChangeNotificationName
{
  return UIDeviceOrientationDidChangeNotification;
}

- (void)registerForOrientationChangeNotification
{
  [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(orientationChanged:) name:self.orientationChangeNotificationName object:nil];
}

- (void)resignFromOrientationChangeNotification
{
  [[NSNotificationCenter defaultCenter] removeObserver:self name:self.orientationChangeNotificationName object:nil];
  [[UIDevice currentDevice] endGeneratingDeviceOrientationNotifications];
}

#pragma mark - processing notifications

- (void)orientationChanged:(NSNotification *)notification
{
  UIInterfaceOrientation orientation = [self interfaceOrientation];
  if (orientation == self.lastInterfaceOrientation) {
    return;
  }
  
  self.lastInterfaceOrientation = orientation;
  
  if (UIInterfaceOrientationIsPortrait(orientation)) {
    if ([self.delegate respondsToSelector:@selector(orientationDidChangeToPortrait)]) {
      [self.delegate orientationDidChangeToPortrait];
    }
  } else {
    if ([self.delegate respondsToSelector:@selector(orientationDidChangeToLandscape)]) {
      [self.delegate orientationDidChangeToLandscape];
    }
  }
}

@end
