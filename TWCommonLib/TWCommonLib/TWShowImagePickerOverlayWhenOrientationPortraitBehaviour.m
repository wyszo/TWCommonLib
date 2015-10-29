//
//  TWCommonLib
//

#import <KZAsserts/KZAsserts.h>
#import "TWShowImagePickerOverlayWhenOrientationPortraitBehaviour.h"
#import "TWUIImagePickerExtendedEventsObserver.h"
#import "TWOrientationChangeDetectorProtocol.h"
#import "TWOrientationChangeDetectorUsingAccelerometer.h"


@interface TWShowImagePickerOverlayWhenOrientationPortraitBehaviour() <TWOrientationChangeDelegate, TWExtendedUIImagePickerControllerDelegate>

@property (nonatomic, strong) id<TWOrientationChangeDetectorProtocol> orientationChangeDetector;
@property (nonatomic, strong) TWUIImagePickerExtendedEventsObserver *imagePickerEventsObserver;
@property (nonatomic, strong) id<TWImagePickerOverlayProtocol> imagePickerOverlayController;
@property (nonatomic, weak) UIImagePickerController *imagePickerController;

@end


@implementation TWShowImagePickerOverlayWhenOrientationPortraitBehaviour

- (instancetype)initWithImagePickerController:(UIImagePickerController *)imagePickerController imagePickerOverlayController:(id<TWImagePickerOverlayProtocol>)imagePickerOverlayController
{
  AssertTrueOrReturnNil(imagePickerController);
  if (self = [super init]) {
    _imagePickerController = imagePickerController;
    _imagePickerOverlayController = imagePickerOverlayController;
  }
  return self;
}

- (void)activateBehaviour
{
  self.imagePickerEventsObserver = [[TWUIImagePickerExtendedEventsObserver alloc] initWithDelegate:self];
  [self.orientationChangeDetector startDetectingOrientationChanges];
  [self checkOrientationPresentOverlayForPortrait];
}

#pragma mark - Overlay

- (void)presentPortraitOrientationOverlay
{
  [self.imagePickerOverlayController showPickerOverlay];
}

- (void)hidePortraitOrientationOverlay
{
  [self.imagePickerOverlayController hidePickerOverlay];
}

- (void)checkOrientationPresentOverlayForPortrait
{
  AssertTrueOrReturn(self.orientationChangeDetector);
  if (UIInterfaceOrientationIsPortrait(self.orientationChangeDetector.lastInterfaceOrientation)) {
    [self presentPortraitOrientationOverlay];
  }
}

#pragma mark - ExtendedUIImagePickerControllerDelegate

- (void)imagePickerControllerUserDidCaptureItem
{
  [self.imagePickerOverlayController hidePickerOverlay];
  [self.orientationChangeDetector stopDetectingOrientationChanges];
}

- (void)imagePickerControllerUserDidPressRetake
{
  [self.orientationChangeDetector startDetectingOrientationChanges];
  [self checkOrientationPresentOverlayForPortrait];
}

#pragma mark - orientationChangeDetector

- (void)orientationDidChangeToPortrait
{
  [self presentPortraitOrientationOverlay];
}

- (void)orientationDidChangeToLandscape
{
  [self hidePortraitOrientationOverlay];
}

#pragma mark - Lazy initialization

- (id<TWOrientationChangeDetectorProtocol>)orientationChangeDetector
{
  if (!_orientationChangeDetector) {
    _orientationChangeDetector = [TWOrientationChangeDetectorUsingAccelerometer new];
    _orientationChangeDetector.delegate = self;
  }
  return _orientationChangeDetector;
}

@end
