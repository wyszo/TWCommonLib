//
//  TWCommonLib
//

@import CoreData;
#import "TWCommonLib.h"


typedef NSString* (^CellReuseMappingBlock)(NSIndexPath *);


@interface TWCoreDataTableViewDataSource : NSObject <UITableViewDataSource>

@property (copy, nonatomic) NSFetchedResultsController* (^fetchedResultsControllerLazyInitializationBlock)();
@property (copy, nonatomic) void (^deleteCellOnSwipeBlock)(NSIndexPath *indexPath);
@property (copy, nonatomic) void (^moveRowAtIndexPathToIndexPathBlock)(NSIndexPath *fromIndexPath, NSIndexPath *toIndexPath);

/**
 Supports only one type of cells in the tableView
 */
- (instancetype)initWithCellreuseIdentifier:(NSString *)cellReuseIdentifier
                         configureCellBlock:(CellAtIndexPathBlock)configureCellBlock;

/**
 Supports cells with multiple cellIdentifiers
 // TODO: add usage example
 */
- (instancetype)initWithCellReuseMappingBlock:(CellReuseMappingBlock)cellReuseMappingBlock
                           configureCellBlock:(CellAtIndexPathBlock)configureCellBlock;

- (void)resetFetchedResultsController;

- (id)objectAtIndexPath:(NSIndexPath *)indexPath;
- (id<NSFetchedResultsSectionInfo>)sectionInfoForSection:(NSInteger)section;

- (NSInteger)objectCount;
- (NSInteger)sectionsCount;
- (NSIndexPath *)lastTableViewCellIndexPath;

@end
