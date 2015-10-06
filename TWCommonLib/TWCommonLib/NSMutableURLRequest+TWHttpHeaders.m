//
//  TWCommonLib
//

#import "NSMutableURLRequest+TWHttpHeaders.h"
#import <KZAsserts/KZAsserts.h>


@implementation NSMutableURLRequest (TWHttpHeaders)

- (void)addHttpHeadersFromDictionary:(NSDictionary *)httpHeaders
{
  AssertTrueOrReturn(httpHeaders.count);
  
  [httpHeaders enumerateKeysAndObjectsUsingBlock:^(NSString *key, id obj, BOOL *stop) {
    NSString *value = httpHeaders[key];
    [self setValue:value forHTTPHeaderField:key];
  }];
}

@end
