//
//  TWCommonLib
//

@interface TWInterfaceOrientationClassStub : NSObject
- (BOOL)shouldAutorotate;
- (NSUInteger)supportedInterfaceOrientations;
@end


@interface TWInterfaceOrientationPortraitStub : TWInterfaceOrientationClassStub
@end


@interface TWInterfaceOrientationAllButUpsideDownStub  : TWInterfaceOrientationClassStub
@end
