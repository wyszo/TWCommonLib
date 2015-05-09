//
//  TWCommonLib
//

#import <KZAsserts/KZAsserts.h>
#import "TWCommonTypes.h"
#import "TWDispatchMacros.h"


void inline DISPATCH_AFTER(NSTimeInterval when, VoidBlock block)
{
  dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(when * NSEC_PER_SEC)), dispatch_get_main_queue(), block);
}

void DISPATCH_ASYNC(QueuePriority priority, VoidBlock block)
{
  AssertTrueOrReturn(block); // TODO: not safe for C functions! Will crash
  
  dispatch_async(dispatch_get_global_queue(priority, 0), ^{
    block();
  });
}

void DISPATCH_ASYNC_ON_MAIN_THREAD(VoidBlock block)
{
  AssertTrueOrReturn(block); // TODO: not safe for C functions! Will crash
  dispatch_async(dispatch_get_main_queue(), block);
}
