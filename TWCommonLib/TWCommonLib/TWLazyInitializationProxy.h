//
//  TWCommonLib
//

#import <Foundation/Foundation.h>


/**
 Delays object initialization until first non-init method call on that object
 */
@interface TWLazyInitializationProxy : NSProxy

- (instancetype)initWithClass:(Class)aClass;

@end
