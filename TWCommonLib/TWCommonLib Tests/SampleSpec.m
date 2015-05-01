//
//  TWCommonLib
//

#import "Kiwi.h"


SPEC_BEGIN(SampleSpec)

describe(@"Simple tableView", ^{
  it(@"Should have a simple interface", ^{
    
    NSUInteger a = 16;
    NSUInteger b = 26;
    [[theValue(a + b) should] equal:theValue(43)];
    
  });
});

SPEC_END