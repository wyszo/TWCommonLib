//
//  TWCommonLib
//

@interface NSObject (TWObjectLifetime)

- (void)tw_bindLifetimeTo:(NSObject *)owner;
- (void)tw_releaseLifetimeDependencyFrom:(NSObject *)owner;

@end
