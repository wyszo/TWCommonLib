//
//  TWCommonLib
//

@import Foundation;

/**
 The class will stop execution on CoreData errors on debug builds (immediately after they occur). It's sufficient to just create it with [TWMagicalRecordDebugErrorHandler new] and keep a strong reference to it. 
 Has no effect on release builds.
 */
@interface TWMagicalRecordDebugErrorHandler : NSObject

@end
