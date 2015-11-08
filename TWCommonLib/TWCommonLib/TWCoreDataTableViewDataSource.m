//
//  TWCommonLib
//

@import KZAsserts;
#import "TWCoreDataTableViewDataSource.h"
#import "TWCommonMacros.h"

@interface TWCoreDataTableViewDataSource ()

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (copy, nonatomic) void (^configureCellBlock)(UITableViewCell *cell, NSIndexPath *indexPath);
@property (strong, nonatomic) NSString *cellReuseIdentifier;
@property (strong, nonatomic) CellReuseMappingBlock cellReuseMappingBlock;
@property (strong, nonatomic) CellReuseExtendedMappingBlock cellReuseExtendedMappingBlock;

@end

@implementation TWCoreDataTableViewDataSource

#pragma mark - Initialization

- (instancetype)initWithCellReuseMappingBlock:(nonnull CellReuseMappingBlock)cellReuseMappingBlock
                           configureCellBlock:(nonnull CellAtIndexPathBlock)configureCellBlock
{
  AssertTrueOrReturnNil(cellReuseMappingBlock);
  AssertTrueOrReturnNil(configureCellBlock);
  
  self = [super init];
  if (self) {
    // TODO: this won't copy the block (since it's assigned to an array)! bug!
    _cellReuseMappingBlock = cellReuseMappingBlock;
    _configureCellBlock = configureCellBlock;
  }
  return self;
}

- (instancetype)initWithCellReuseExtendedMappingBlock:(nonnull CellReuseExtendedMappingBlock)cellReuseExtendedMappingBlock
                                   configureCellBlock:(nonnull CellAtIndexPathBlock)configureCellBlock
{
  AssertTrueOrReturnNil(cellReuseExtendedMappingBlock);
  AssertTrueOrReturnNil(configureCellBlock);
  
  self = [super init];
  if (self) {
    // TODO: this won't copy the block (since it's assigned to an array)! bug!
    _cellReuseExtendedMappingBlock = cellReuseExtendedMappingBlock;
    _configureCellBlock = configureCellBlock;
  }
  return self;
}

- (instancetype)initWithCellReuseIdentifier:(nonnull NSString *)cellReuseIdentifier
                         configureCellBlock:(nonnull CellAtIndexPathBlock)configureCellBlock
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
  else if (self.cellReuseMappingBlock) {
    AssertTrueOr(self.cellReuseIdentifier.length == 0,);
    AssertTrueOrReturnNil(self.cellReuseMappingBlock);
    
    reuseIdentifier = self.cellReuseMappingBlock(indexPath);
  }
  else {
    AssertTrueOr(self.cellReuseIdentifier.length == 0,);
    AssertTrueOr(self.cellReuseMappingBlock == nil,);
    AssertTrueOrReturnNil(self.cellReuseExtendedMappingBlock);
    
    id object = [self objectAtIndexPath:indexPath];
    reuseIdentifier = self.cellReuseExtendedMappingBlock(object, indexPath);
  }
  AssertTrueOrReturnNil(reuseIdentifier.length);
  return reuseIdentifier;
}

#pragma mark - Index sections

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    return (self.displaySectionIndex ? [self.fetchedResultsController sectionIndexTitles] : nil);
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {
    return [self.fetchedResultsController sectionForSectionIndexTitle:title atIndex:index];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return (self.displaySectionTitle ? [self.fetchedResultsController sectionIndexTitles][section] : nil);
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
