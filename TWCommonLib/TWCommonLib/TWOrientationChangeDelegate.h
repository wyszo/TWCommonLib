//
//  TWCommonLib
//

@import Foundation;

@protocol TWOrientationChangeDelegate <NSObject>

- (void)orientationDidChangeToPortrait;
- (void)orientationDidChangeToLandscape;

@end
