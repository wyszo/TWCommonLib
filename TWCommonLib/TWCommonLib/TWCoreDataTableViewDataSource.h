//
//  TWCommonLib
//

@import CoreData;
#import "TWCommonTypes.h"

typedef NSString* (^CellReuseMappingBlock)(NSIndexPath *);
typedef NSString* (^CellReuseExtendedMappingBlock)(id object, NSIndexPath *);


@interface TWCoreDataTableViewDataSource<__covariant T:NSManagedObject *> : NSObject <UITableViewDataSource>

@property (copy, nonatomic) NSFetchedResultsController* (^fetchedResultsControllerLazyInitializationBlock)();
@property (copy, nonatomic) void (^deleteCellOnSwipeBlock)(NSIndexPath *indexPath);
@property (copy, nonatomic) void (^moveRowAtIndexPathToIndexPathBlock)(NSIndexPath *fromIndexPath, NSIndexPath *toIndexPath);
@property (assign, nonatomic) BOOL displaySectionIndex;
@property (assign, nonatomic) BOOL displaySectionTitle;

#pragma mark - Initializers

/**
 Supports only one type of cells in the tableView
 */
- (instancetype)initWithCellReuseIdentifier:(nonnull NSString *)cellReuseIdentifier
                         configureCellBlock:(nonnull CellAtIndexPathBlock)configureCellBlock;

/**
 Supports cells with multiple cellIdentifiers
 The block passed in this method only takes indexPath as a parameter. If you need an actual object to determine reuse identifier, use initWithCellReuseExtendedMappingBlock:configureCellBlock
 
 TODO: add usage example
 */
- (instancetype)initWithCellReuseMappingBlock:(nonnull CellReuseMappingBlock)cellReuseMappingBlock
                           configureCellBlock:(nonnull CellAtIndexPathBlock)configureCellBlock;

/**
 Supports cells with multiple cellIdentifiers
 The block passed in this method takes both indexPath and an actual object as a parameter.
 
 TODO: add usage example
 */
- (nonnull instancetype)initWithCellReuseExtendedMappingBlock:(nonnull CellReuseExtendedMappingBlock)cellReuseExtendedMappingBlock
                                           configureCellBlock:(nonnull CellAtIndexPathBlock)configureCellBlock;

/**
 @deprecated (Typo in a method name)
 Use initWithCellReuseIdentifier:configureCellBlock: instead
 */
- (instancetype)initWithCellreuseIdentifier:(nonnull NSString *)cellReuseIdentifier
                         configureCellBlock:(nonnull CellAtIndexPathBlock)configureCellBlock __attribute__((deprecated));

#pragma mark - Public

- (void)resetFetchedResultsController;

- (T)objectAtIndexPath:(NSIndexPath *)indexPath;
- (id<NSFetchedResultsSectionInfo>)sectionInfoForSection:(NSInteger)section;

- (NSInteger)objectCount;
- (NSInteger)sectionsCount;
- (NSIndexPath *)lastTableViewCellIndexPath;

@end
