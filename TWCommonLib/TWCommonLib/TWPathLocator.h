//
//  TWCommonLib
//

@import Foundation;


@interface TWPathLocator : NSObject

- (NSString *)documentsPath;
- (NSURL *)documentsPathURL;
- (void)printDocumentsPath;

@end
