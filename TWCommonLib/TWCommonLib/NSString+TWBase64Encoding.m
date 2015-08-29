//
//  TWCommonLib
//

#import "NSString+TWBase64Encoding.h"

@implementation NSString (TWBase64Encoding)

- (NSString *)tw_base64EncodedString
{
  NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
  return [data base64EncodedStringWithOptions:0];
}

@end
