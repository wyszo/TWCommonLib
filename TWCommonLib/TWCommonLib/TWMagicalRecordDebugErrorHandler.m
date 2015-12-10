//
//  TWCommonLib
//

@import KZAsserts;
@import MagicalRecord;
#import "TWMagicalRecordDebugErrorHandler.h"

@implementation TWMagicalRecordDebugErrorHandler

- (instancetype)init
{
#ifndef DEBUG 
  // Error handler completely turned off on release builds
  return nil;
#else
  self = [super init];
  if (self) {
    [self setupErrorHandling];
  }
  return self;
#endif
}

- (void)setupErrorHandling
{
  [MagicalRecord setErrorHandlerTarget:self action:@selector(handleError:)];
}

#pragma mark - Error handling

- (void)handleError:(NSError *)error
{
  NSLog(@"Core data error! %@", [error description]);
  AssertTrueOrReturn(@"CoreData error!");
}

@end
