//
//  TWCommonLib
//


#ifndef __TWCommonLib__TWCommonFunctions__
#define __TWCommonLib__TWCommonFunctions__

@import UIKit;

// Returns CGRect starting from (0,0) with a given size
FOUNDATION_EXPORT CGRect CGRectFromSize(CGSize size);

/**
 Deprecated, use ValueInRange instead
 */
FOUNDATION_EXPORT CGFloat valueInRange(CGFloat min, CGFloat max, CGFloat value) DEPRECATED_ATTRIBUTE;

FOUNDATION_EXPORT CGFloat ValueInRange(CGFloat min, CGFloat max, CGFloat value);

#endif
