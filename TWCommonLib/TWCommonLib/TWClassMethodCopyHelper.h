//
//  TWCommonLib
//

#import <Foundation/Foundation.h>


@interface TWClassMethodCopyHelper : NSObject

- (void)copyMethodFromClass:(Class)sourceClass withSelector:(SEL)selector toClass:destinationClass;

@end
