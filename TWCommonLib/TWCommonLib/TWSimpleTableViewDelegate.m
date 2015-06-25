//
//  TWCommonLib
//

#import <KZAsserts/KZAsserts.h>
#import "TWSimpleTableViewDelegate.h"
#import "TWCommonMacros.h"


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
  CallBlock(self.cellSelectedBlock, indexPath);
  
  if (self.deselectCellOnTouch) {
    [[tableView cellForRowAtIndexPath:indexPath] setSelected:NO animated:YES];
  }
}

@end
