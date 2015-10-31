//
//  TWCommonLib
//

@import KZAsserts;
#import "NSString+TWHTMLString.h"

@implementation NSString (TWHTMLString)

+ (nullable NSString *)tw_htmlStringFromFileNamed:(nonnull NSString *)filename
{
  AssertTrueOrReturnNil(filename.length);
  NSString *htmlFile = [[NSBundle mainBundle] pathForResource:filename ofType:nil];
  return [NSString stringWithContentsOfFile:htmlFile encoding:NSUTF8StringEncoding error:nil];
}

@end
