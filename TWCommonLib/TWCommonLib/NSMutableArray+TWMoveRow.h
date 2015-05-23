//
//  TWCommonLib
//

#import <Foundation/Foundation.h>


@interface NSMutableArray (TWMoveRow)

- (void)moveObjectFromIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath;

@end
