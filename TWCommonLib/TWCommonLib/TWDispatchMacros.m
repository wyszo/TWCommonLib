//
//  TWCommonLib
//

#import <KZAsserts/KZAsserts.h>
#import "TWDispatchMacros.h"
#import "TWCommonMacros.h"


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

void DISPATCH_SYNC_ON_MAIN_THREAD(VoidBlock block)
{
  AssertTrueOrReturn(block);
  
  dispatch_queue_t dispatchQueue = dispatch_get_current_queue();
  dispatch_queue_t mainQueue = dispatch_get_main_queue();
  
  if (dispatchQueue == mainQueue) {
    CallBlock(block);
  }
  else {
    dispatch_sync(mainQueue, ^{
      CallBlock(block);
    });
  }
}
