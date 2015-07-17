//
//  TWCommonLib
//

#import "TWCommonTypes.h"


/**
 TODO: Redirect all the unimplemented delegate methods to TableViewController!!
 TODO: Bind lifecycle to a tableView!!
 TODO: implement tableView:heightForRowAtIndexPath: method only if cellHeightBlock is set
 */
@interface TWSimpleTableViewDelegate : NSObject <UITableViewDelegate>

@property (nonatomic, copy) IndexPathBlock cellSelectedBlock;
@property (nonatomic, copy) FloatBlockWithIndexPathParameter cellHeightBlock;
@property (nonatomic, assign) BOOL deselectCellOnTouch;

- (instancetype)initAndAttachToTableView:(UITableView *)tableView;
- (instancetype)initAndAttachToTableView:(UITableView *)tableView cellHeightBlock:(FloatBlockWithIndexPathParameter)cellHeightBlock;

@end
