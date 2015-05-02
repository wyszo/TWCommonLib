//
//  TWCommonLib
//

#ifndef TWCommonLib_Header_h
#define TWCommonLib_Header_h

#import <UIKit/UIKit.h>


typedef void (^VoidBlock)();
typedef void (^BlockWithFloatParameter)(CGFloat);
typedef void (^CellAtIndexPathBlock)(UITableViewCell *cell, NSIndexPath *indexPath);
typedef void (^IndexPathBlock)(NSIndexPath *indexPath);


#endif
