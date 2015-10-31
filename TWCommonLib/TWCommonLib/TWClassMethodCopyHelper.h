//
//  TWCommonLib
//

@import Foundation;

@interface TWClassMethodCopyHelper : NSObject

- (void)copyMethodFromClass:(Class)sourceClass withSelector:(SEL)selector toClass:destinationClass;

@end
