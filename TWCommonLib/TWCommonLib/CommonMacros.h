//
//  TWCommonLib
//

#ifndef TWCommonLib_CommonMacros_h
#define TWCommonLib_CommonMacros_h


// Inside methods
#define CallBlock(block, ...) (block ? block(__VA_ARGS__) : nil);
#define defineWeakSelf() __weak typeof(self) weakSelf = self

// Inside methods - assertions
#define NOT_IMPLEMENTED_YET_RETURN AssertTrueOrReturn(NO && @"Not implemented yet");
#define NOT_IMPLEMENTED_YET_RETURN_NIL AssertTrueOrReturnNil(NO && @"Not implemented yet");

// Inside class interface definition
#define NEW_AND_INIT_UNAVAILABLE - (instancetype)new __unavailable; - (instancetype)init __unavailable;


#endif
