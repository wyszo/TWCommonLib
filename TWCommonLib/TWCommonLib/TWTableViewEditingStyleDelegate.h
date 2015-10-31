//
//  TWCommonLib
//

#import "TWCommonMacros.h"

/**
 Can be useful for a tableView which supports just changing cells order
 */
@interface TWTableViewEditingStyleDelegate : NSObject <UITableViewDelegate>

NEW_AND_INIT_UNAVAILABLE
- (instancetype)initWithUITableViewCellEditingStyle:(UITableViewCellEditingStyle)editingStyle attachToTableView:(UITableView *)tableView;

@end
