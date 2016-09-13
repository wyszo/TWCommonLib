//
//  TWCommonLib
//

@import Foundation;

@interface NSString (TWHTMLString)

- (nullable NSString *)tw_stringByRemovingHtmlTags;

+ (nullable NSString *)tw_htmlStringFromFileNamed:(nonnull NSString *)filename;

@end
