//
//  TWCommonLib
//

#ifndef TWCommonLib_TWCommonMacros_h
#define TWCommonLib_TWCommonMacros_h


// Inside methods
#define CallBlock(block, ...) (block ? block(__VA_ARGS__) : nil);
#define defineWeakSelf() __weak typeof(self) weakSelf = self

#define SuppressPerformSelectorLeakWarning(Code) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Code; \
_Pragma("clang diagnostic pop") \
} while (0)


// Inside methods - assertions
#define NOT_IMPLEMENTED_YET_RETURN AssertTrueOrReturn(NO && @"Not implemented yet");
#define NOT_IMPLEMENTED_YET_RETURN_NIL AssertTrueOrReturnNil(NO && @"Not implemented yet");

// Inside class interface definition
#define NEW_AND_INIT_UNAVAILABLE - (instancetype)new __unavailable; - (instancetype)init __unavailable;


#endif
