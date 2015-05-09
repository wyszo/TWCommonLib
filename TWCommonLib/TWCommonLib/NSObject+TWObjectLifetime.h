//
//  TWCommonLib
//

/**
 This class allows to keep the object in memory until another object gets deleted - works the same way as keeping the strong property, except you can bind any NSObject to any NSObject. Internally uses associated properties to achieve that.
 */
@interface NSObject (TWObjectLifetime)

- (void)tw_bindLifetimeTo:(NSObject *)owner;
- (void)tw_releaseLifetimeDependencyFrom:(NSObject *)owner;

@end
