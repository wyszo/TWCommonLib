//
//  TWCommonLib
//

@import KZAsserts;
#import "TWArrayTableViewDataSource.h"
#import "NSMutableArray+TWMoveRow.h"

@interface TWArrayTableViewDataSource ()

@property (strong, nonatomic) NSMutableArray *array;
@property (weak, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSString *cellDequeueIdentifier;

@end

@implementation TWArrayTableViewDataSource

- (instancetype)initWithArray:(NSArray *)array tableView:(UITableView *)tableView attachToTableView:(BOOL)attachToTableView cellNibName:(NSString *)cellNibName
{
  AssertTrueOrReturnNil(cellNibName);
  
  if (self = [super init]) {
    [self initializeWithArray:array tableView:tableView attachToTableView:attachToTableView];
    
    _cellDequeueIdentifier = @"cell";
    
    UINib *tableViewCellNib = [UINib nibWithNibName:cellNibName bundle:[NSBundle mainBundle]];
    [_tableView registerNib:tableViewCellNib forCellReuseIdentifier:_cellDequeueIdentifier];
  }
  return self;
}

- (instancetype)initWithArray:(NSArray *)array tableView:(UITableView *)tableView attachToTableView:(BOOL)attachToTableView cellDequeueIdentifier:(NSString *)cellDequeueIdentifier
{
  AssertTrueOrReturnNil(cellDequeueIdentifier.length);
  
  if (self = [super init]) {
    [self initializeWithArray:array tableView:tableView attachToTableView:attachToTableView];
    _cellDequeueIdentifier = cellDequeueIdentifier;
  }
  return self;
}

- (void)initializeWithArray:(NSArray *)array tableView:(UITableView *)tableView attachToTableView:(BOOL)attachToTableView
{
    AssertTrueOrReturn(array);
    AssertTrueOrReturn(tableView);
    
    _array = [array mutableCopy];
    _tableView = tableView;
    
    if (attachToTableView) {
        [self attachDataSourceToTableView];
    }
}

- (void)attachDataSourceToTableView {
    _tableView.dataSource = self;
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
  if (self.configureCellBlock) {
    self.configureCellBlock(cell, indexPath);
  }
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return self.array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self cellForRowAtIndexPath:indexPath];
}

- (UITableViewCell *)cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:self.cellDequeueIdentifier];
    [self configureCell:cell atIndexPath:indexPath];
    return cell;
}

#pragma mark - deleting objects

- (void)removeObject:(id)object
{
  AssertTrueOrReturn(object);
  AssertTrueOrReturn([self.array containsObject:object]);
  [self.array removeObject:object];
}

- (void)removeObjectAtIndex:(NSUInteger)index
{
  AssertTrueOrReturn(self.array.count > index);
  [self.array removeObjectAtIndex:index];
}

#pragma mark - retrieving objects

- (id)objectAtIndexPath:(NSIndexPath *)indexPath
{
  AssertTrueOrReturnNil(self.array.count > indexPath.row);
  return self.array[indexPath.row];
}

- (NSInteger)objectCount
{
  return self.array.count;
}

- (NSArray *)allSteps
{
  return [self.array copy];
}

- (NSString *)cellDequeueIdentifier
{
  AssertTrueOrReturnNil(_cellDequeueIdentifier.length);
  return _cellDequeueIdentifier;
}

#pragma mark - moving cells

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
  return YES; 
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
  [self.array moveObjectFromIndexPath:fromIndexPath toIndexPath:toIndexPath];
}

@end
