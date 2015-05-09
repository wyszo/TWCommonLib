//
//  TWCommonLib
//

#import "TWOrientationChangeDelegate.h"


/**
 Since the class uses CoreMotion and an accelerometer, remember to turn it off when not using to preserve battery life
 */
@interface TWOrientationChangeDetectorUsingAccelerometer : NSObject

@property (nonatomic, weak) id<TWOrientationChangeDelegate> delegate;

@property (nonatomic, assign, readonly) UIInterfaceOrientation lastInterfaceOrientation;

- (void)startDetectingOrientationChanges;
- (void)stopDetectingOrientationChanges;

@end
