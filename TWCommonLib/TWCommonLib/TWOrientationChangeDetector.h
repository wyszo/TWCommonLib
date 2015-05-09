//
//  TWCommonLib
//

#import "TWOrientationChangeDelegate.h"


/**
 Uses UIDeviceOrientationDidChangeNotification to observe UI orientation chagnes. It won't pick up a change if the device is orientation-locked (the change can then still occur on some views - for example when recording a video).
 */
@interface TWOrientationChangeDetector : NSObject

@property (nonatomic, weak) id<TWOrientationChangeDelegate> delegate;

@property (nonatomic, assign, readonly) UIInterfaceOrientation lastInterfaceOrientation;

- (void)startDetectingOrientationChanges;
- (void)stopDetectingOrientationChanges;

@end
