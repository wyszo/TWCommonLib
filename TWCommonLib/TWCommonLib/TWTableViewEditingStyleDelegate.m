//
//  TWCommonLib
//

@import KZAsserts;
#import "TWTableViewEditingStyleDelegate.h"

@interface TWTableViewEditingStyleDelegate ()
@property (nonatomic, assign) UITableViewCellEditingStyle editingStyle;
@end

@implementation TWTableViewEditingStyleDelegate

- (instancetype)initWithUITableViewCellEditingStyle:(UITableViewCellEditingStyle)editingStyle attachToTableView:(UITableView *)tableView
{
  AssertTrueOrReturnNil(tableView);
  
  self = [super init];
  if (self) {
    _editingStyle = editingStyle;
    tableView.delegate = self;
  }
  return self;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
  return self.editingStyle;
}

@end
