//
//  TWCommonLib
//

#import "TWCommonMacros.h"


@interface TWItemsToSeguesMapping : NSObject

NEW_AND_INIT_UNAVAILABLE

- (instancetype)initWithMenuItems:(NSArray *)menuItems segues:(NSArray *)segues;

- (NSString *)menuItemForIndex:(NSInteger)index;
- (NSString *)menuSegueForIndex:(NSInteger)index;
- (NSArray *)menuItems;

@end
