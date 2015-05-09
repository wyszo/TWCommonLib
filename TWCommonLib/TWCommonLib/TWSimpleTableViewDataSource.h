//
//  TWCommonLib
//

#import <UIKit/UIKit.h>
#import "TWCommonMacros.h"
#import "TWSimpleTableViewCell.h"


/**
 The class serves as a simplified version of TWArrayTableViewDataSource and is eventually meant to replace it 
 
 TODO: finish the implementation!!
 */
@interface TWSimpleTableViewDataSource : NSObject

NEW_AND_INIT_UNAVAILABLE

/**
 @param  cells   An array of SimpleTableViewCell instances
 @param  tableView  TableView to attach to, mandatory. The class it's setting itself as tableView's dataSource automatically.
 */
- (instancetype)initWithCells:(NSArray *)cells bindToTableView:(UITableView *)tableView;

@end
