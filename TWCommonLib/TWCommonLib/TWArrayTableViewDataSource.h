//
//  TWCommonLib
//

#import "TWCommonTypes.h"
#import "TWObjectCountProtocol.h"

NS_ASSUME_NONNULL_BEGIN

// TODO: dataSource should bind it's lifecycle to a tableView lifespan
// TODO: modify interface so it's possible to add cells like elements in UIAlertController

@interface TWArrayTableViewDataSource<__covariant T> : NSObject <UITableViewDataSource, TWObjectCountProtocol>

@property (copy, nonatomic) CellAtIndexPathBlock configureCellBlock;

// TODO: provide initializers that allow to have more than one type of cells

/**
 For tableViews with cells from xib
 */
- (instancetype)initWithArray:(NSArray<T> *)array attachToTableView:(UITableView *)tableView cellNibName:(NSString *)cellNibName;

/**
 For tableViews with prototype cells from Storyboard
 */
- (instancetype)initWithArray:(NSArray<T> *)array attachToTableView:(UITableView *)tableView cellDequeueIdentifier:(NSString *)cellDequeueIdentifier;

- (void)removeObject:(T)object;
- (void)removeObjectAtIndex:(NSUInteger)index;
- (T)objectAtIndexPath:(NSIndexPath *)indexPath;
- (NSInteger)objectCount;
- (NSArray *)allSteps;

@end

NS_ASSUME_NONNULL_END