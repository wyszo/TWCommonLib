//
//  TWCommonLib
//

@interface NSString (TWTrimming)

- (NSString *)tw_stringByTrimmingWhitespaceAndNewline;
- (NSString *)tw_stringByRemovingLastOccurrenceOfString:(NSString *)stringToReplace fromLastNumberOfCharacters:(NSInteger)characterRange;

- (NSString *)tw_stringByRemovingWhitespaceAndNewline;

/**
 Replaces multiple whitespaces in string with just one
 */
- (NSString *)tw_condensedWhitespace;

@end
