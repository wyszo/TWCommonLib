//
//  TWCommonLib
//

#import "Kiwi.h"
#import "TWSimpleTableViewDataSource.h"


// TODO: add TWSimpleTableViewCell tests
// TODO: finish writing dataSource tests


SPEC_BEGIN(SimpleTableViewDataSourceSpec)

describe(@"SimpleTableViewDataSource", ^{
  
  TWSimpleTableViewCell *sampleCell = [TWSimpleTableViewCell cellWithDequeueIdentifier:@"-" action:nil];
  NSArray *cellsArray = @[ sampleCell ];
  UITableView *tableView = [UITableView new];
  
  context(@"When being created", ^{
    
    it(@"Should throw an assertion when passing an empty cells list", ^{
      [[theBlock(^{
        id obj = [[TWSimpleTableViewDataSource alloc] initWithCells:nil bindToTableView:tableView]; obj =obj;
      }) should] raise];
    
      [[theBlock(^{
        id obj = [[TWSimpleTableViewDataSource alloc] initWithCells:[NSArray new] bindToTableView:tableView]; obj=obj;
      }) should] raise];
    });
    
    it(@"Should throw an assertion when not providing a tableView to attach to", ^{
      [[theBlock(^{
        id obj = [[TWSimpleTableViewDataSource alloc] initWithCells:@[ sampleCell ] bindToTableView:nil]; obj=obj;
      }) should] raise];
    });
    
    it(@"Should throw an assertion when provided with objects of type different than TWSimpleTableViewCell", ^{
      [[theBlock(^{
        NSArray *objects = @[ [NSObject new] ];
        id obj = [[TWSimpleTableViewDataSource alloc] initWithCells:objects bindToTableView:tableView]; obj=obj;
      }) should] raise];
    });
    
    it (@"Should not throw an exception if parameters are correct", ^{
      [[theBlock(^{
        id obj = [[TWSimpleTableViewDataSource alloc] initWithCells:cellsArray bindToTableView:tableView]; obj=obj;
      }) shouldNot] raise];
    });
  });
});

SPEC_END
