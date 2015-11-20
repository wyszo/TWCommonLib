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

/// Use cellSelectedExtendedBlock instead
@property (nonatomic, copy) IndexPathBlock cellSelectedBlock DEPRECATED_ATTRIBUTE;

/// Apart from an indexPath will give you associated object (as long as tableView dataSource conforms to protocol TWObjectAtIndexPathProtocol)
@property (nonatomic, copy) IndexPathWithObjectBlock cellSelectedExtendedBlock;

@property (nonatomic, copy) FloatBlockWithIndexPathParameter cellHeightBlock;
@property (nonatomic, copy) void (^scrollViewDidScrollBlock)(UIScrollView *scrollView);
@property (nonatomic, assign) BOOL deselectCellOnTouch;

- (instancetype)initAndAttachToTableView:(UITableView *)tableView;
- (instancetype)initAndAttachToTableView:(UITableView *)tableView cellHeightBlock:(FloatBlockWithIndexPathParameter)cellHeightBlock;

@end
