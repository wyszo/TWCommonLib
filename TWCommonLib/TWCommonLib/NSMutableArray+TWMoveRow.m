//
//  TWCommonLib
//

#import "NSMutableArray+TWMoveRow.h"
#import <KZAsserts/KZAsserts.h>


@implementation NSMutableArray (TWMoveRow)

- (void)moveObjectFromIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
  AssertTrueOrReturn(fromIndexPath.row < self.count);
  AssertTrueOrReturn(toIndexPath.row < self.count);
  
  if (fromIndexPath.row == toIndexPath.row) {
    return;
  }
  
  id objectToMove = self[fromIndexPath.row];
  [self removeObjectAtIndex:fromIndexPath.row];
  
  if (toIndexPath.row >= self.count) {
    [self addObject:objectToMove];
  }
  else {
    [self insertObject:objectToMove atIndex:toIndexPath.row];
  }
}

@end
