//
//  TWCommonLib
//

@import UIKit;
#import "TWCommonMacros.h"

@interface TWTableViewNibRegisteringHelper : NSObject

NEW_AND_INIT_UNAVAILABLE

- (nonnull instancetype)initWithTableView:(nonnull UITableView *)tableView;

/**
 Registers nibs in format: <prefix><nibName><sufix> with reuse identifier: <prefix><nibName><sufix>ReuseIdentifier
 */
- (void)registerNibNames:(nonnull NSArray *)nibNames withPrefix:(nullable NSString *)prefix sufix:(nullable NSString *)sufix;

+ (nonnull NSString *)reuseIdentifierSufix;

@end
