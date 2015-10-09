//
//  TWCommonLib
//

@import KZAsserts;
@import MediaPlayer;
#import "TWVideoPlaybackErrorHandler.h"

@implementation TWVideoPlaybackErrorHandler

- (instancetype)init
{
#ifndef DEBUG
  // Error handler completely turned off on release builds
  return nil;
#else
  self = [super init];
  if (self) {
    [self registerForNotifications];
  }
  return self;
#endif
}

- (void)registerForNotifications
{
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleMoviePlayerPlaybackDidFinishNotification:) name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
}

- (void)dealloc
{
  [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Notification handling

- (void)handleMoviePlayerPlaybackDidFinishNotification:(NSNotification *)notification
{
  NSDictionary *userInfo = [notification userInfo];
  NSNumber *reason = userInfo[MPMoviePlayerPlaybackDidFinishReasonUserInfoKey];
  MPMovieFinishReason finishReason = [reason integerValue];
  if (finishReason == MPMovieFinishReasonPlaybackError) {
    NSError *error = userInfo[@"error"];
    NSLog(@"Video playback error: %@", error);
    AssertTrueOrReturn(NO && @"Video playback error");
  }
}

@end
