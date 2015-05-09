//
//  TWCommonLib
//

#import "TWCommonTypes.h"


// TODO: dataSource should bind it's lifecycle to a tableView lifespan
// TODO: modify interface so it's possible to add cells like elements in UIAlertController

@interface TWArrayTableViewDataSource : NSObject <UITableViewDataSource>

@property (copy, nonatomic) CellAtIndexPathBlock configureCellBlock;

/**
 For tableViews with cells from xib
 */
- (instancetype)initWithArray:(NSArray *)array attachToTableView:(UITableView *)tableView cellNibName:(NSString *)cellNibName;

/**
 For tableViews with prototype cells from Storyboard
 */
- (instancetype)initWithArray:(NSArray *)array attachToTableView:(UITableView *)tableView cellDequeueIdentifier:(NSString *)cellDequeueIdentifier;

- (void)removeObject:(id)object;
- (void)removeObjectAtIndex:(NSUInteger)index;
- (id)objectAtIndexPath:(NSIndexPath *)indexPath;
- (NSInteger)objectCount;
- (NSArray *)allSteps;

@end
