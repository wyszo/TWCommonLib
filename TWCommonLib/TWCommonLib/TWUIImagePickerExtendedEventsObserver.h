//
//  CommonLib
//

#import "TWExtendedUIImagePickerControllerDelegate.h"

@interface TWUIImagePickerExtendedEventsObserver : NSObject

@property (nonatomic, weak) id<TWExtendedUIImagePickerControllerDelegate> delegate;

- (instancetype)initWithDelegate:(id<TWExtendedUIImagePickerControllerDelegate>)delegate;

@end
