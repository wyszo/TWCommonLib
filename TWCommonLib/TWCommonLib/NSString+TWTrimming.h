//
//  TWCommonLib
//

@interface NSString (TWTrimming)

- (NSString *)tw_stringByTrimmingWhitespaceAndNewline;
- (NSString *)tw_stringByRemovingLastOccurrenceOfString:(NSString *)stringToReplace fromLastNumberOfCharacters:(NSInteger)characterRange;

@end
