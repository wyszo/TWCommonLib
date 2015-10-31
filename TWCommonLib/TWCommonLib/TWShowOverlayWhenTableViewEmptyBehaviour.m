//
//  CommonLib
//

@import KZAsserts;
#import "TWShowOverlayWhenTableViewEmptyBehaviour.h"

@interface TWShowOverlayWhenTableViewEmptyBehaviour ()

@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, weak) id<TWObjectCountProtocol> dataSource;
@property (nonatomic, strong) UIView *overlayView;
@property (nonatomic, assign) BOOL allowScrollingWhenNoCells;

@end

@implementation TWShowOverlayWhenTableViewEmptyBehaviour

- (instancetype)initWithTableView:(UITableView *)tableView dataSource:(id<TWObjectCountProtocol>)dataSource overlayView:(UIView *)alternativeView allowScrollingWhenNoCells:(BOOL)allowScrollingWhenNoCells;
{
  AssertTrueOrReturnNil(tableView);
  AssertTrueOrReturnNil(dataSource);
  AssertTrueOrReturnNil(alternativeView);
  
  self = [super init];
  if (self) {
    _tableView = tableView;
    _dataSource = dataSource;
    _overlayView = alternativeView;
    _allowScrollingWhenNoCells = allowScrollingWhenNoCells;
  }
  return self;
}

- (void)updateTableViewScrollingAndOverlayViewVisibility
{
  AssertTrueOrReturn(self.tableView);
  AssertTrueOrReturn(self.dataSource);
  AssertTrueOrReturn(self.overlayView);
  
  if (self.dataSource.objectCount == 0) {
    if (self.altersScrollingBehaviour) {
      self.tableView.scrollEnabled = NO;
    }
    self.overlayView.hidden = NO;
  }
  else {
    if (self.altersScrollingBehaviour) {
      self.tableView.scrollEnabled = YES;
    }
    self.overlayView.hidden = YES;
  }
}

- (BOOL)altersScrollingBehaviour
{
  return (self.allowScrollingWhenNoCells == NO);
}

@end
