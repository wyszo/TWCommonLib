//
//  TWCommonLib
//

@import KZAsserts;
#import "NSString+TWHTMLString.h"

@implementation NSString (TWHTMLString)

- (NSString *)tw_stringByRemovingHtmlTags {
    NSRange range;
    NSString *result = [self copy];
    while ((range = [result rangeOfString:@"<[^>]+>" options:NSRegularExpressionSearch]).location != NSNotFound) {
        result = [result stringByReplacingCharactersInRange:range withString:@""];
    }
    return result;
}

+ (NSString *)tw_htmlStringFromFileNamed:(nonnull NSString *)filename
{
  AssertTrueOrReturnNil(filename.length);
  NSString *htmlFile = [[NSBundle mainBundle] pathForResource:filename ofType:nil];
  return [NSString stringWithContentsOfFile:htmlFile encoding:NSUTF8StringEncoding error:nil];
}

@end
