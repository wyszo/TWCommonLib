//
//  TWCommonLib
//

@import Foundation;

/**
 The class will stop execution on VideoPlayback errors on debug builds allowing you to investigate the error code and error message from the SDK. It's sufficient to just create it with [TWMagicalRecordDebugErrorHandler new] and keep a strong reference to it.
 Has no effect on release builds.
 */
@interface TWVideoPlaybackErrorHandler : NSObject

@end
