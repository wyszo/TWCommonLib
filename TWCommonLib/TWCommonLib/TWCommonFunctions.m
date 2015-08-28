//
//  TWCommonLib
//

#import "TWCommonFunctions.h"

CGRect CGRectFromSize(CGSize size) {
  return CGRectMake(0, 0, size.width, size.height);
}

CGFloat valueInRange(CGFloat min, CGFloat max, CGFloat value) {
  CGFloat result = (value > max ? max : value);
  return (result < min ? min : result);
}
