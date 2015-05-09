//
//  TWCommonLib
//

#import <KZAsserts/KZAsserts.h>
#import "TWSimpleTableViewDelegate.h"


@implementation TWSimpleTableViewDelegate

- (instancetype)initAndAttachToTableView:(UITableView *)tableView
{
  AssertTrueOrReturnNil(tableView);
  
  self = [super init];
  if (self) {
    tableView.delegate = self;
  }
  return self;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  if (self.cellSelectedBlock) {
    self.cellSelectedBlock(indexPath);
  }
  
  if (self.deselectCellOnTouch) {
    [[tableView cellForRowAtIndexPath:indexPath] setSelected:NO animated:YES];
  }
}

@end
