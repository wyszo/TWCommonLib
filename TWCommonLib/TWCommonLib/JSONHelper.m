//
//  ChopinSelfie
//

#import "JSONHelper.h"
#import <KZAsserts.h>


@implementation JSONHelper

- (id)jsonObjectFromFileNamed:(NSString *)filename
{
  AssertTrueOrReturnNil(filename.length);
  
  NSError *error;
  NSString *json = [[NSString alloc] initWithContentsOfFile:filename encoding:NSUTF8StringEncoding error:&error];
  AssertTrueOrReturnNil(error == nil);
  
  id jsonObject = [NSJSONSerialization JSONObjectWithData:[json dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:&error];
  AssertTrueOrReturnNil(error == nil);
  
  return jsonObject;
}

- (NSDictionary *)jsonDictionaryFromFileNamed:(NSString *)filename
{
  AssertTrueOrReturnNil(filename.length);
  id jsonObject = [[JSONHelper new] jsonObjectFromFileNamed:filename];
  AssertTrueOrReturnNil([jsonObject isKindOfClass:[NSDictionary class]]);
  return (NSDictionary *)jsonObject;
}

@end
