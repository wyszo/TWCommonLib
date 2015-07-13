//
//  TWCommonLib
//

/**
 This class allows to keep the object in memory until another object gets deleted - works the same way as keeping the strong property, except you can bind any NSObject to any NSObject. Internally uses associated properties to achieve that.
 */
@interface NSObject (TWObjectLifetime)

- (void)tw_bindLifetimeTo:(nonnull NSObject *)owner;
- (void)tw_releaseLifetimeDependencyFrom:(nonnull NSObject *)owner;

- (void)tw_bindLifetimeTo:(nonnull NSObject *)owner usingKey:(nonnull NSString *)key;
- (nullable id)tw_getAttachedObjectWithKey:(nonnull NSString *)key;
- (void)tw_releaseAttachedObjectFromOwner:(nonnull NSObject *)owner withKey:(nonnull NSString *)key;

@end
