//
//  ChopinSelfie
//

@interface TWJSONHelper : NSObject

- (id)jsonObjectFromFileNamed:(NSString *)filename;
- (NSDictionary *)jsonDictionaryFromFileNamed:(NSString *)filename;

@end
