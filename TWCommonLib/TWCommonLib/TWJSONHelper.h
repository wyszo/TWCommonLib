//
//  ChopinSelfie
//

@interface TWJSONHelper : NSObject

- (id)jsonObjectFromFilePath:(NSString *)filepath;

- (NSDictionary *)jsonDictionaryFromFilePath:(NSString *)filepath;
- (NSDictionary *)jsonDictionaryFromBundledFileNamed:(NSString *)filename;

@end
