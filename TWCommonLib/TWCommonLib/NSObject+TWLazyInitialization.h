//
//  TWCommonLib
//

@import Foundation;

// TODO: write unit tests and extract this to a separate Pod
/**
 Category allowing smart LazyInitialization. 
 Usage: call lazy instead of alloc.

 Examples:
    
    NSString *lazyString = [[NSString lazy] initWithString:@"lazy string"];
    
    NSObject *lazyObjectWithStandardInit = [NSObject lazy]; // will call init automatically
    
    NSManagedObjectContext *context = [NSManagedObjectContext lazyWithBlock:^() {
      return [NSManagedObjectContext MR_context];
    }];
 
 Original implementation: http://andyarvanitis.com/lazy-initialization-for-objective-c/
 
 Potential improvement - making it a 'safe' category: drop 'tw_' prefix from method names and ensure no other object implements 'lazy' and 'lazyWithBlock:' methods. 
 Instruction on how to do that: http://andyarvanitis.com/objective-c-safe-categories/
 */
@interface NSObject (TWLazyInitialization)

+ (instancetype)tw_lazy;
+ (instancetype)tw_lazyWithBlock:(id (^)())initBlock;

@end
