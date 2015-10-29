//
//  TWCommonLib
//

@import Foundation;

// TODO: merge this class with TWFilesystemHelper
@interface TWPathLocator : NSObject

- (NSString *)documentsPath;
- (NSURL *)documentsPathURL;
- (void)printDocumentsPath;

@end
