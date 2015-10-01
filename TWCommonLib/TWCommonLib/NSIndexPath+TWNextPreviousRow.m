//
//  TWCommonLib
//

#import "NSIndexPath+TWNextPreviousRow.h"

@implementation NSIndexPath (TWNextPreviosRow)

- (nullable NSIndexPath *)tw_previousRowIndexPath
{
  if (self.row == 0) {
    return nil;
  }
  return [NSIndexPath indexPathForRow:(self.row - 1) inSection:self.section];
}

- (nullable NSIndexPath *)tw_nextRowIndexPath
{
  return [NSIndexPath indexPathForRow:(self.row + 1) inSection:self.section];
}

@end
