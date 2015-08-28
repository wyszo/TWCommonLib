//
//  TWCommonLib
//

#ifndef TWCommonLib_Header_h
#define TWCommonLib_Header_h

@import UIKit;


typedef void (^VoidBlock)();
typedef void (^VoidBlockWithError)(NSError *error);
typedef void (^VoidBlockWithImage)(UIImage *image);

typedef void (^BlockWithBoolParameter)(BOOL);
typedef void (^BlockWithFloatParameter)(CGFloat);
typedef CGFloat (^FloatBlockWithIndexPathParameter)(NSIndexPath *indexPath);
typedef void (^CellAtIndexPathBlock)(UITableViewCell *cell, NSIndexPath *indexPath);
typedef void (^CollectionViewCellAtIndexPathBlock)(UICollectionViewCell *cell, NSIndexPath *indexPath);
typedef void (^IndexPathBlock)(NSIndexPath *indexPath);


#endif
