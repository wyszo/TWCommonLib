//
//  TWCommonLib
//

#import "TWCoreDataTableViewDataSource.h"
#import "TWCommonMacros.h"
#import <KZAsserts.h>


@interface TWCoreDataTableViewDataSource ()

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (copy, nonatomic) void (^configureCellBlock)(UITableViewCell *cell, NSIndexPath *indexPath);
@property (strong, nonatomic) NSString *cellReuseIdentifier;
@property (strong, nonatomic) CellReuseMappingBlock cellReuseMappingBlock;

@end


@implementation TWCoreDataTableViewDataSource

#pragma mark - Initialization

- (instancetype)initWithCellReuseMappingBlock:(CellReuseMappingBlock)cellReuseMappingBlock
                           configureCellBlock:(CellAtIndexPathBlock)configureCellBlock
{
  AssertTrueOrReturnNil(cellReuseMappingBlock);
  AssertTrueOrReturnNil(configureCellBlock);
  
  self = [super init];
  if (self) {
    _cellReuseMappingBlock = cellReuseMappingBlock;
    _configureCellBlock = configureCellBlock;
  }
  return self;
}

- (instancetype)initWithCellReuseIdentifier:(NSString *)cellReuseIdentifier
                         configureCellBlock:(CellAtIndexPathBlock)configureCellBlock
{
  AssertTrueOrReturnNil(cellReuseIdentifier.length);
  AssertTrueOrReturnNil(configureCellBlock);
  
  self = [super init];
  if (self) {
    _configureCellBlock = configureCellBlock;
    _cellReuseIdentifier = cellReuseIdentifier;
  }
  return self;
}

- (instancetype)initWithCellreuseIdentifier:(NSString *)cellReuseIdentifier
                         configureCellBlock:(CellAtIndexPathBlock)configureCellBlock
__attribute__((deprecated))
{
  AssertTrueOrReturnNil(cellReuseIdentifier.length);
  AssertTrueOrReturnNil(configureCellBlock);
  
  self = [super init];
  if (self) {
    _configureCellBlock = configureCellBlock;
    _cellReuseIdentifier = cellReuseIdentifier;
  }
  return self;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  return self.fetchedResultsController.sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return [self sectionInfoForSection:section].numberOfObjects;
}

- (id<NSFetchedResultsSectionInfo>)sectionInfoForSection:(NSInteger)section
{
  return self.fetchedResultsController.sections[section];
}

- (NSInteger)sectionsCount
{
  AssertTrueOr(self.fetchedResultsController, return 0;);
  return self.fetchedResultsController.sections.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  NSString *reuseIdentifier = [self reuseIdentifierForCellAtIndexPath:indexPath];
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
  AssertTrueOrReturnNil(cell);
  
  if (self.configureCellBlock) {
    self.configureCellBlock(cell, indexPath);
  }
  return cell;
}

- (NSString *)reuseIdentifierForCellAtIndexPath:(NSIndexPath *)indexPath
{
  AssertTrueOrReturnNil(indexPath);
  NSString *reuseIdentifier;
 
  if (self.cellReuseIdentifier.length) {
    AssertTrueOr(self.cellReuseMappingBlock == nil,);
    reuseIdentifier = self.cellReuseIdentifier;
  }
  else {
    AssertTrueOr(self.cellReuseIdentifier.length == 0,);
    AssertTrueOrReturnNil(self.cellReuseMappingBlock);
    reuseIdentifier = self.cellReuseMappingBlock(indexPath);
  }
  AssertTrueOrReturnNil(reuseIdentifier.length);
  return reuseIdentifier;
}

#pragma mark - Deleting cells

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
  return (self.deleteCellOnSwipeBlock != nil);
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
  return (self.moveRowAtIndexPathToIndexPathBlock != nil);
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
  if (self.moveRowAtIndexPathToIndexPathBlock) {
    self.moveRowAtIndexPathToIndexPathBlock(fromIndexPath, toIndexPath);
  }
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
  if (self.deleteCellOnSwipeBlock && editingStyle == UITableViewCellEditingStyleDelete) {
    self.deleteCellOnSwipeBlock(indexPath);
  }
}

#pragma mark - Lazy Initialization

- (NSFetchedResultsController *)fetchedResultsController
{
  if (!_fetchedResultsController) {
    if (self.fetchedResultsControllerLazyInitializationBlock) {
      _fetchedResultsController = self.fetchedResultsControllerLazyInitializationBlock();
    }
  }
  return _fetchedResultsController;
}

#pragma mark - Other methods

- (void)resetFetchedResultsController
{
  _fetchedResultsController = nil;
}

- (id)objectAtIndexPath:(NSIndexPath *)indexPath
{
  // TODO: simply return [fetchedResultsController objectAtIndexPath:]
  id <NSFetchedResultsSectionInfo> sectionInfo = [self sectionInfoForSection:indexPath.section];
  AssertTrueOrReturnNil(sectionInfo.objects.count > indexPath.row);
  return sectionInfo.objects[indexPath.row];
}

- (NSIndexPath *)lastTableViewCellIndexPath
{
  NSInteger lastSectionIndex = self.fetchedResultsController.sections.count - 1;
  AssertTrueOrReturnNil(lastSectionIndex >= 0);
  
  NSInteger lastRowInLastSectionIndex = [self sectionInfoForSection:lastSectionIndex].numberOfObjects - 1;
  AssertTrueOrReturnNil(lastRowInLastSectionIndex >= 0);
  
  NSIndexPath *indexPath = [NSIndexPath indexPathForRow:lastRowInLastSectionIndex inSection:lastSectionIndex];
  return indexPath;
}

- (NSInteger)objectCount
{
  AssertTrueOr(self.fetchedResultsController, return 0;);
  return self.fetchedResultsController.fetchedObjects.count;
}

@end
