//
//  TWCommonLib
//

#import "TWOrientationChangeDetectorProtocol.h"

/**
 Uses UIDeviceOrientationDidChangeNotification to observe UI orientation chagnes. It won't pick up a change if the device is orientation-locked (the change can then still occur on some views - for example when recording a video).
 */
@interface TWOrientationChangeDetector : NSObject <TWOrientationChangeDetectorProtocol>

@end
