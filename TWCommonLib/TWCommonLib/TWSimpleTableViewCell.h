//
//  TWCommonLib
//

#import <UIKit/UIKit.h>
#import "CommonMacros.h"
#import "CommonTypes.h"


/**
 Mean to be used with TWSimpleTableViewDataSource
 */
@interface TWSimpleTableViewCell : UITableViewCell

NEW_AND_INIT_UNAVAILABLE

+ (instancetype)cellWithNibName:(NSString *)nibName action:(VoidBlock)actionBlock;
+ (instancetype)cellWithDequeueIdentifier:(NSString *)dequeueIdentifier action:(VoidBlock)actionBlock;

@end
