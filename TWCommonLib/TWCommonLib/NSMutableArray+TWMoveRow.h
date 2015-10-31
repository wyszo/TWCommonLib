//
//  TWCommonLib
//

@import Foundation;

@interface NSMutableArray (TWMoveRow)

- (void)moveObjectFromIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath;

@end
