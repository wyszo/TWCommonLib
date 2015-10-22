//
//  TWCommonLib
//

@import KZAsserts;
#import "NSURLCache+TWCache.h"

static CGFloat const kBytesToMegabytesDenominator = 1024.0 * 1024.0;
static CGFloat const kMegabytesToBytesCoefficient = kBytesToMegabytesDenominator;


@implementation NSURLCache (TWCache)

#pragma mark - Cache size

+ (void)tw_setMemoryCacheSizeMegabytes:(CGFloat)memoryCacheSizeMegabytes diskCacheSizeMegabytes:(CGFloat)diskCacheMegabytes
{
  NSUInteger memoryCacheInBytes = memoryCacheSizeMegabytes * kMegabytesToBytesCoefficient;
  NSUInteger diskCacheInBytes = diskCacheMegabytes * kMegabytesToBytesCoefficient;
  
  NSURLCache *cache = [[NSURLCache alloc] initWithMemoryCapacity:memoryCacheInBytes diskCapacity:diskCacheInBytes diskPath:nil];
  [NSURLCache setSharedURLCache:cache];
}

#pragma mark - Public interface 

- (nullable NSCachedURLResponse *)tw_cachedHTTPResponseForURLRequest:(nonnull NSURLRequest *)request;
{
  AssertTrueOrReturnNil(request);
  
  NSCachedURLResponse *cachedResponse = [self cachedResponseForRequest:request];
  return cachedResponse;
}

- (nullable NSCachedURLResponse *)tw_cachedHTTPResponseForURLRequestWithURLString:(nonnull NSString *)urlString
{
  AssertTrueOrReturnNil(urlString.length);
  
  NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:urlString]];
  return [self tw_cachedHTTPResponseForURLRequest:request];
}

#pragma mark - Diagnostic helpers

- (CGFloat)tw_memoryCacheCapacityInMegabytes
{
  return (self.memoryCapacity / kBytesToMegabytesDenominator);
}

- (CGFloat)tw_diskCacheCapacityInMegabytes
{
  return (self.diskCapacity / kBytesToMegabytesDenominator);
}

- (CGFloat)tw_memoryCacheUssageInMegabytes
{
  return (self.currentMemoryUsage / kBytesToMegabytesDenominator);
}

- (CGFloat)tw_diskCacheUssageInMegabytes
{
  return (self.currentDiskUsage / kBytesToMegabytesDenominator);
}


@end
