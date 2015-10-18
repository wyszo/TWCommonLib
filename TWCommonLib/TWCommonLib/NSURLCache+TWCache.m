//
//  TWCommonLib
//

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
