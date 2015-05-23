//
//  PlayerAid
//

@import CoreData;
#import "TWCommonLib.h"


@interface TWCoreDataTableViewDataSource : NSObject <UITableViewDataSource>

@property (copy, nonatomic) NSFetchedResultsController* (^fetchedResultsControllerLazyInitializationBlock)();
@property (copy, nonatomic) void (^deleteCellOnSwipeBlock)(NSIndexPath *indexPath);
@property (copy, nonatomic) void (^moveRowAtIndexPathToIndexPathBlock)(NSIndexPath *fromIndexPath, NSIndexPath *toIndexPath);


- (instancetype)initWithCellreuseIdentifier:(NSString *)cellReuseIdentifier
                         configureCellBlock:(CellAtIndexPathBlock)configureCellBlock;
- (void)resetFetchedResultsController;

- (id)objectAtIndexPath:(NSIndexPath *)indexPath;
- (id<NSFetchedResultsSectionInfo>)sectionInfoForSection:(NSInteger)section;

- (NSInteger)objectCount;
- (NSInteger)sectionsCount;
- (NSIndexPath *)lastTableViewCellIndexPath;

@end
