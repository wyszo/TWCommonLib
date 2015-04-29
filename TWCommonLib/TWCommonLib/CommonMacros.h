//
//  TWCommonLib
//

#ifndef TWCommonLib_CommonMacros_h
#define TWCommonLib_CommonMacros_h


#define defineWeakSelf() __weak typeof(self) weakSelf = self

#define NEW_AND_INIT_UNAVAILABLE - (instancetype)new __unavailable; - (instancetype)init __unavailable;

#define NOT_IMPLEMENTED_YET_RETURN AssertTrueOrReturn(NO && @"Not implemented yet");
#define NOT_IMPLEMENTED_YET_RETURN_NIL AssertTrueOrReturnNil(NO && @"Not implemented yet");

#endif
