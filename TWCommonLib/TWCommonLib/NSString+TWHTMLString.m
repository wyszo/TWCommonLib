//
//  TWCommonLib
//

#import "NSString+TWHTMLString.h"
#import <KZAsserts/KZAsserts.h>

@implementation NSString (TWHTMLString)

+ (nullable NSString *)htmlStringFromFileNamed:(nonnull NSString *)filename
{
  AssertTrueOrReturnNil(filename.length);
  NSString *htmlFile = [[NSBundle mainBundle] pathForResource:filename ofType:nil];
  return [NSString stringWithContentsOfFile:htmlFile encoding:NSUTF8StringEncoding error:nil];
}

@end
