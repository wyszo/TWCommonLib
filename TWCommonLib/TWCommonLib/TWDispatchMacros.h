//
//  TWCommonLib
//

#ifndef TWCommonLib_TWDispatchMacros_h
#define TWCommonLib_TWDispatchMacros_h

#import "TWCommonTypes.h"

typedef NS_ENUM(long, QueuePriority) {
  QueuePriorityHigh = DISPATCH_QUEUE_PRIORITY_HIGH,
  QueuePriorityLow = DISPATCH_QUEUE_PRIORITY_LOW,
  QueuePriorityBackground = DISPATCH_QUEUE_PRIORITY_BACKGROUND,
  QueuePriorityDefault = DISPATCH_QUEUE_PRIORITY_DEFAULT
};


extern void DISPATCH_AFTER(NSTimeInterval when, VoidBlock);
extern void DISPATCH_ASYNC(QueuePriority priority, VoidBlock);
extern void DISPATCH_ASYNC_ON_MAIN_THREAD(VoidBlock);
extern void DISPATCH_SYNC_ON_MAIN_THREAD(VoidBlock);

#endif
