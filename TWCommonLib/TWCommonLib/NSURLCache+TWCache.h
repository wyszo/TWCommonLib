//
//  TWCommonLib
//

@import Foundation;

@interface NSURLCache (TWCache)

+ (void)tw_setMemoryCacheSizeMegabytes:(CGFloat)memoryCacheSizeMegabytes diskCacheSizeMegabytes:(CGFloat)diskCacheMegabytes;

- (nullable NSCachedURLResponse *)tw_cachedHTTPResponseForURLRequest:(nonnull NSURLRequest *)request;
- (nullable NSCachedURLResponse *)tw_cachedHTTPResponseForURLRequestWithURLString:(nonnull NSString *)urlString;

- (CGFloat)tw_memoryCacheCapacityInMegabytes;
- (CGFloat)tw_diskCacheCapacityInMegabytes;

- (CGFloat)tw_memoryCacheUssageInMegabytes;
- (CGFloat)tw_diskCacheUssageInMegabytes;

- (void)tw_debug_clearCache;

@end
