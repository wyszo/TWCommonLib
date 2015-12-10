//
//  TWCommonLib
//

@import KZAsserts;
#import "TWTableViewNibRegisteringHelper.h"
#import "UITableView+TWRegisterNib.h"

static NSString *const kReuseIdentifierSufix = @"ReuseIdentifier";

@interface TWTableViewNibRegisteringHelper ()
@property (nonatomic, weak) UITableView *tableView;
@end

@implementation TWTableViewNibRegisteringHelper

- (nonnull instancetype)initWithTableView:(nonnull UITableView *)tableView
{
  AssertTrueOrReturnNil(tableView);
  
  self = [super init];
  if (self) {
    _tableView = tableView;
  }
  return self;
}

- (void)registerNibNames:(nonnull NSArray *)nibNames withPrefix:(nullable NSString *)prefix sufix:(nullable NSString *)sufix
{
  AssertTrueOrReturn(nibNames.count);
  AssertTrueOrReturn(self.tableView);
  
  for (NSString *rawNibName in nibNames) {
    AssertTrueOrContinue(rawNibName.length);
    
    NSString *prefixedNibName = [self nibName:rawNibName withPrefix:prefix sufix:sufix];
    
    NSString *reuseIdentifier = [self tutorialStepReuseIdentifierForXibName:prefixedNibName];
    AssertTrueOrContinue(reuseIdentifier.length);
    
    [self.tableView registerNibWithName:prefixedNibName forCellReuseIdentifier:reuseIdentifier];
  }
}

+ (nonnull NSString *)reuseIdentifierSufix
{
  return kReuseIdentifierSufix;
}

#pragma mark - Private

- (NSString *)nibName:(nonnull NSString *)nibName withPrefix:(nullable NSString *)prefix sufix:(nullable NSString *)sufix
{
  AssertTrueOrReturnNil(nibName);
  return [NSString stringWithFormat:@"%@%@%@", prefix, nibName, sufix];
}

- (NSString *)tutorialStepReuseIdentifierForXibName:(nonnull NSString *)xibName
{
  AssertTrueOrReturnNil(xibName.length);
  return [NSString stringWithFormat:@"%@%@", xibName, kReuseIdentifierSufix];
}

@end
