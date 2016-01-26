//
//  TWCommonLib
//

@import KZAsserts;
#import "TWSimpleTableViewDelegate.h"
#import "TWCommonMacros.h"
#import "TWObjectAtIndexPathProtocol.h"

@interface TWSimpleTableViewDelegate()
@property (nonatomic, weak) UITableView *tableView;
@end

@implementation TWSimpleTableViewDelegate

- (instancetype)initAndAttachToTableView:(UITableView *)tableView
{
  AssertTrueOrReturnNil(tableView);
  
  self = [super init];
  if (self) {
    _tableView = tableView;
    _tableView.delegate = self;
  }
  return self;
}

- (instancetype)initAndAttachToTableView:(UITableView *)tableView cellHeightBlock:(FloatBlockWithIndexPathParameter)cellHeightBlock
{
    AssertTrueOrReturnNil(tableView);
    AssertTrueOrReturnNil(cellHeightBlock);
    
    self = [super init];
    if (self) {
        tableView.delegate = self;
        _cellHeightBlock = cellHeightBlock;
    }
    return self;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
SUPPRESS_DEPRECATION_WARNINGS_BEGIN
  CallBlock(self.cellSelectedBlock, indexPath);
SUPPRESS_DEPRECATION_WARNINGS_END
  
  [self invokeCellSelectedExtendedBlockIfNeededForIndexPath:indexPath];
  
  if (self.deselectCellOnTouch) {
    [[tableView cellForRowAtIndexPath:indexPath] setSelected:NO animated:YES];
  }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat cellHeight = tableView.rowHeight;
    
    if (self.cellHeightBlock) {
        cellHeight = self.cellHeightBlock(indexPath);
    }
    return ceilf(cellHeight);
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CallBlock(self.scrollViewDidScrollBlock, scrollView);
}

#pragma mark - Private 

- (void)invokeCellSelectedExtendedBlockIfNeededForIndexPath:(nonnull NSIndexPath *)indexPath
{
  AssertTrueOrReturn(indexPath);
  
  if (!self.cellSelectedExtendedBlock) {
    return;
  }
  
  id object;
  if ([self.tableView.dataSource conformsToProtocol:@protocol(TWObjectAtIndexPathProtocol)]) {
    id<TWObjectAtIndexPathProtocol> dataSource = (id)self.tableView.dataSource;
    object = [dataSource objectAtIndexPath:indexPath];
  }
  else {
    AssertTrueOr(NO && @"TableView dataSource should implement ObjectCountProtocol for this to work!",);
  }
  CallBlock(self.cellSelectedExtendedBlock, indexPath, object);
}

@end
