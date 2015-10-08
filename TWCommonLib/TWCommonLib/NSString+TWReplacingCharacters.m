//
//  TWCommonLib
//

#import "NSString+TWReplacingCharacters.h"

@implementation NSString (TWReplacingCharacters)

- (nonnull NSString *)tw_stringByReplacingCharactersInString:(nonnull NSString *)charactersToReplace withString:(nonnull NSString *)replaceByString
{
  NSString *result = [NSString stringWithString:self];
  
  for (NSInteger index = 0; index < charactersToReplace.length; index++) {
    unichar character = [charactersToReplace characterAtIndex:index];
    NSString *characterString = [NSString stringWithFormat:@"%C", character];
    
    result = [result stringByReplacingOccurrencesOfString:characterString withString:replaceByString];
  }
  return result;
}

@end
