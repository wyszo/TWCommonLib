//
//  TWCommonLib
//

#import <UIKit/UIKit.h>
#import "TWCommonMacros.h"
#import "TWCommonTypes.h"


/**
 Mean to be used with TWSimpleTableViewDataSource
 */
@interface TWSimpleTableViewCell : UITableViewCell

NEW_AND_INIT_UNAVAILABLE

+ (instancetype)cellWithNibName:(NSString *)nibName action:(VoidBlock)actionBlock;
+ (instancetype)cellWithDequeueIdentifier:(NSString *)dequeueIdentifier action:(VoidBlock)actionBlock;

@end
