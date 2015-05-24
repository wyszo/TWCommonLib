//
//  TWCommonLib
//

#import <Foundation/Foundation.h>


/**
 Category allowing smart LazyInitialization. 
 Usage: call lazy instead of alloc.

 Examples:
    NSString *lazyString = [[NSString lazy] initWithString:@"lazy string"];
    NSObject *lazyObjectWithStandardInit = [NSObject lazy]; // will call init automatically
 
 Original implementation: http://andyarvanitis.com/lazy-initialization-for-objective-c/
 */
@interface NSObject (TWLazyInitialization)

+ (instancetype)lazy;

@end
