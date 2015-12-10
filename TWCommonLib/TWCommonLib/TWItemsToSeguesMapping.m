//
//  TWCommonLib
//

@import KZAsserts;
#import "TWItemsToSeguesMapping.h"

@interface TWItemsToSeguesMapping()
@property (nonatomic, copy) NSArray *menuItems;
@property (nonatomic, copy) NSArray *segues;
@end

@implementation TWItemsToSeguesMapping

- (instancetype)initWithMenuItems:(NSArray *)menuItems segues:(NSArray *)segues
{
  AssertTrueOrReturnNil(menuItems);
  AssertTrueOrReturnNil(segues);
  AssertTrueOrReturnNil(menuItems.count == segues.count);
  
  if (self = [super init]) {
    _menuItems = menuItems;
    _segues = segues;
  }
  return self;
}

#pragma mark - Safe access

- (NSString *)menuItemForIndex:(NSInteger)row
{
  return [self nonZeroLengthStringFromArray:self.menuItems atIndex:row];
}

- (NSString *)menuSegueForIndex:(NSInteger)row
{
  return [self nonZeroLengthStringFromArray:self.segues atIndex:row];
}

- (NSString *)nonZeroLengthStringFromArray:(NSArray *)array atIndex:(NSInteger)index
{
  AssertTrueOrReturnNil(index < array.count);
  NSString *item = array[index];
  AssertTrueOrReturnNil(item.length);
  return item;
}

@end
