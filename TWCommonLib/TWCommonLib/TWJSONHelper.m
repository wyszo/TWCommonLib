//
//  ChopinSelfie
//

#import "TWJSONHelper.h"
#import <KZAsserts/KZAsserts.h>


@implementation TWJSONHelper

- (id)jsonObjectFromFilePath:(NSString *)filepath
{
  AssertTrueOrReturnNil(filepath.length);
  
  NSError *error;
  NSString *json = [[NSString alloc] initWithContentsOfFile:filepath encoding:NSUTF8StringEncoding error:&error];
  AssertTrueOrReturnNil(error == nil);
  
  id jsonObject = [NSJSONSerialization JSONObjectWithData:[json dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:&error];
  AssertTrueOrReturnNil(error == nil);
  
  return jsonObject;
}

- (NSDictionary *)jsonDictionaryFromBundledFileNamed:(NSString *)filename
{
  NSString *resourcePath = [self pathForResurceNamed:filename];
  AssertTrueOrReturnNil(resourcePath.length);
  return [self jsonDictionaryFromFilePath:resourcePath];
}

- (NSDictionary *)jsonDictionaryFromFilePath:(NSString *)filepath
{
  AssertTrueOrReturnNil(filepath.length);
  id jsonObject = [[TWJSONHelper new] jsonObjectFromFilePath:filepath];
  AssertTrueOrReturnNil([jsonObject isKindOfClass:[NSDictionary class]]);
  return (NSDictionary *)jsonObject;
}

- (NSString *)pathForResurceNamed:(NSString *)filename
{
  return [[NSBundle mainBundle] pathForResource:filename ofType:nil];
}
   
@end
