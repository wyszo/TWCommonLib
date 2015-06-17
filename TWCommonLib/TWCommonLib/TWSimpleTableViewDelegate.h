//
//  TWCommonLib
//

#import "TWCommonTypes.h"


/**
 TODO: Redirect all the unimplemented delegate methods to TableViewController!!
 TODO: Bind lifecycle to a tableView!!
 */
@interface TWSimpleTableViewDelegate : NSObject <UITableViewDelegate>

@property (nonatomic, copy) IndexPathBlock cellSelectedBlock;
@property (nonatomic, assign) BOOL deselectCellOnTouch;

- (instancetype)initAndAttachToTableView:(UITableView *)tableView;

@end
