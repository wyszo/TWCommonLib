//
//  TWCommonLib
//

@import UIKit;
#import "TWOrientationChangeDelegate.h"

@protocol TWOrientationChangeDetectorProtocol <NSObject>
@required

@property (nonatomic, weak) id<TWOrientationChangeDelegate> delegate;
@property (nonatomic, assign, readonly) UIInterfaceOrientation lastInterfaceOrientation;

- (void)startDetectingOrientationChanges;
- (void)stopDetectingOrientationChanges;

@end
