//
//  TWCommonLib
//

#import "TWOrientationChangeDetectorProtocol.h"


/**
 Since the class uses CoreMotion and an accelerometer, remember to turn it off when not using to preserve battery life
 */
@interface TWOrientationChangeDetectorUsingAccelerometer : NSObject <TWOrientationChangeDetectorProtocol>

@end
