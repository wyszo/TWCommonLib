//
//  TWCommonLib
//

#ifndef TWCommonLib_CommonMacros_h
#define TWCommonLib_CommonMacros_h


#define defineWeakSelf() __weak typeof(self) weakSelf = self
#define NEW_AND_INIT_UNAVAILABLE - (instancetype)new __unavailable; - (instancetype)init __unavailable;


#endif
