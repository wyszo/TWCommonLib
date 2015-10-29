//
//  TWCommonLib
//

@import Foundation;

@interface NSString (TWReplacingCharacters)

- (nonnull NSString *)tw_stringByReplacingCharactersInString:(nonnull NSString *)charactersToReplace withString:(nonnull NSString *)replaceBy;

@end
