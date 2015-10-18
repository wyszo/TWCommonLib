//
//  TWCommonLib
//

@import Foundation;

@interface NSURLCache (TWCache)

+ (void)tw_setMemoryCacheSizeMegabytes:(CGFloat)memoryCacheSizeMegabytes diskCacheSizeMegabytes:(CGFloat)diskCacheMegabytes;

- (CGFloat)tw_memoryCacheCapacityInMegabytes;
- (CGFloat)tw_diskCacheCapacityInMegabytes;

- (CGFloat)tw_memoryCacheUssageInMegabytes;
- (CGFloat)tw_diskCacheUssageInMegabytes;

@end
