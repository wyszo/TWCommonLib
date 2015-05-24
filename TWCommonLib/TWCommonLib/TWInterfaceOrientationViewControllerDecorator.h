//
//  TWCommonLib
//

/**
 Adds shouldAutorotate and supportedInterfaceOrientations methods implementation to a selected class
 */
@interface TWInterfaceOrientationViewControllerDecorator : NSObject

- (void)addInterfaceOrientationMethodsToClass:(Class)aClass shouldAutorotate:(BOOL)shouldAutorotate;

@end
