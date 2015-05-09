//
//  ChopinSelfie
//

@interface JSONHelper : NSObject

- (id)jsonObjectFromFileNamed:(NSString *)filename;
- (NSDictionary *)jsonDictionaryFromFileNamed:(NSString *)filename;

@end
