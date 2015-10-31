//
//  TWCommonLib
//

@import KZAsserts;
#import "NSString+TWTrimming.h"

@implementation NSString (TWTrimming)

- (NSString *)tw_stringByTrimmingWhitespaceAndNewline
{
  return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (NSString *)tw_stringByRemovingLastOccurrenceOfString:(NSString *)stringToReplace fromLastNumberOfCharacters:(NSInteger)characterRange
{
  AssertTrueOrReturnNil(stringToReplace.length);
  AssertTrueOrReturnNil(characterRange > 0);
  if (!self.length) {
    return nil;
  }
  NSString *resultString = self;
  
  NSRange lastOccurrenceRange = [resultString rangeOfString:stringToReplace options:NSBackwardsSearch];
  if (lastOccurrenceRange.location >= resultString.length - characterRange) {
    resultString = [resultString stringByReplacingCharactersInRange:lastOccurrenceRange withString:@""];
  }
  return resultString;
}

@end
