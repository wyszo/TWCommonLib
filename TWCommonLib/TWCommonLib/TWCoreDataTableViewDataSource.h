//
//  TWCommonLib
//

@import CoreData;
#import "TWCommonTypes.h"
#import "TWObjectCountProtocol.h"
#import "TWObjectAtIndexPathProtocol.h"

typedef NSString* _Nonnull (^CellReuseMappingBlock)(NSIndexPath * _Nonnull);
typedef NSString* _Nonnull (^CellReuseExtendedMappingBlock)(id _Nonnull object, NSIndexPath * _Nonnull);


NS_ASSUME_NONNULL_BEGIN

@interface TWCoreDataTableViewDataSource<__covariant T:NSManagedObject *> : NSObject <UITableViewDataSource, TWObjectCountProtocol, TWObjectAtIndexPathProtocol>

@property (copy, nonatomic) NSFetchedResultsController* (^fetchedResultsControllerLazyInitializationBlock)();
@property (copy, nonatomic, nullable) void (^deleteCellOnSwipeBlock)(NSIndexPath * indexPath);
@property (copy, nonatomic, nullable) void (^moveRowAtIndexPathToIndexPathBlock)(NSIndexPath * fromIndexPath, NSIndexPath * toIndexPath);
@property (assign, nonatomic) BOOL displaySectionIndex;
@property (assign, nonatomic) BOOL displaySectionTitle;

#pragma mark - Initializers

/**
 Supports only one type of cells in the tableView
 */
- (instancetype)initWithCellReuseIdentifier:(NSString *)cellReuseIdentifier
                         configureCellBlock:(CellAtIndexPathBlock)configureCellBlock;

/**
 Supports only one type of cells in the tableView
 */
- (instancetype)initWithCellReuseIdentifier:(NSString *)cellReuseIdentifier
                         configureCellWithObjectBlock:(CellWithObjectAtIndexPathBlock)configureCellBlock;

/**
 Supports cells with multiple cellIdentifiers
 The block passed in this method only takes indexPath as a parameter. If you need an actual object to determine reuse identifier, use initWithCellReuseExtendedMappingBlock:configureCellBlock
 
 TODO: add usage example
 */
- (instancetype)initWithCellReuseMappingBlock:(CellReuseMappingBlock)cellReuseMappingBlock
                           configureCellBlock:(CellAtIndexPathBlock)configureCellBlock;

/**
 Supports cells with multiple cellIdentifiers
 The block passed in this method takes both indexPath and an actual object as a parameter.
 
 TODO: add usage example
 */
- (instancetype)initWithCellReuseExtendedMappingBlock:(CellReuseExtendedMappingBlock)cellReuseExtendedMappingBlock
                                   configureCellBlock:(CellAtIndexPathBlock)configureCellBlock;

#pragma mark - Public

- (void)resetFetchedResultsController;

- (nullable T)objectAtIndexPath:(NSIndexPath *)indexPath;
- (nullable id<NSFetchedResultsSectionInfo>)sectionInfoForSection:(NSInteger)section;

- (NSInteger)objectCount;
- (NSInteger)sectionsCount;
- (nullable NSIndexPath *)lastTableViewCellIndexPath;

- (void)performFetchAssertResults;

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END
