//
//  TWCommonLib
//

@import UIKit;

@interface NSIndexPath (TWNextPreviosRow)

/**
 Returns index path with a row number decreased by one in the same section
 */
- (nullable NSIndexPath *)tw_previousRowIndexPath;

/**
 Returns index path with a row number increased by one in the same section. 
 Remember to check if that index path exists in your tableView.
 */
- (nullable NSIndexPath *)tw_nextRowIndexPath;

@end
