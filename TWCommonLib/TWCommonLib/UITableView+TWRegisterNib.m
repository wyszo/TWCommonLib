//
//  TWCommonLib
//

@import KZAsserts;
#import "UITableView+TWRegisterNib.h"

@implementation UITableView (TWRegisterNib)

- (void)registerNibWithName:(NSString *)nibName forCellReuseIdentifier:(NSString *)reuseIdentifier
{
  AssertTrueOrReturn(nibName.length);
  AssertTrueOrReturn(reuseIdentifier.length);
  
  UINib *nib = [UINib nibWithNibName:nibName bundle:nil];
  [self registerNib:nib forCellReuseIdentifier:reuseIdentifier];
}

@end
