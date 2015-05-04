//
//  TWCommonLib
//

@protocol TWOrientationChangeDelegate;


@interface TWOrientationChangeDetector : NSObject

@property (nonatomic, weak) id<TWOrientationChangeDelegate> delegate;

@property (nonatomic, assign, readonly) UIInterfaceOrientation lastInterfaceOrientation;

- (void)startDetectingOrientationChanges;
- (void)stopDetectingOrientationChanges;

@end


@protocol TWOrientationChangeDelegate <NSObject>

- (void)orientationDidChangeToPortrait;
- (void)orientationDidChangeToLandscape;

@end
