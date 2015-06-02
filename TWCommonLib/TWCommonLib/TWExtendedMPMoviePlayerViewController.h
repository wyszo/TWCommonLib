//
//  TWCommonLib
//

#import <MediaPlayer/MediaPlayer.h>


/**
 Standard MoviePlayerController allowing to choose initial orientation
 */
@interface TWExtendedMPMoviePlayerViewController : MPMoviePlayerViewController

@property (nonatomic, assign) BOOL presentInLandscapeOrientation;

@end
