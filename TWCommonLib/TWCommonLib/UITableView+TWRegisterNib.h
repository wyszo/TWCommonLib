//
//  TWCommonLib
//

@import UIKit;

@interface UITableView (TWRegisterNib)

/**
 Registers nib from mainBundle with reuseIdentifier
 */
- (void)registerNibWithName:(NSString *)nibName forCellReuseIdentifier:(NSString *)reuseIdentifier;

@end
