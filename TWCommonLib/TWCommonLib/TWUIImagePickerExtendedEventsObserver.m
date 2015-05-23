//
//  CommonLib
//

#import "TWUIImagePickerExtendedEventsObserver.h"


static NSString *const kImagePickerUserDidCaptureItemNotificationName = @"_UIImagePickerControllerUserDidCaptureItem";
static NSString *const kImagePickerUserDidRejectItemNotificationName = @"_UIImagePickerControllerUserDidRejectItem";


@implementation TWUIImagePickerExtendedEventsObserver

#pragma mark - Lifecycle

- (instancetype)initWithDelegate:(id<TWExtendedUIImagePickerControllerDelegate>)delegate
{
  self = [super init];
  if (self) {
    _delegate = delegate;
    [self registerforImagePickerControllerDidCaptureNotification];
    [self registerForImagePickerControllerDidPressRetakeNotification];
  }
  return self;
}

- (void)dealloc
{
  [self resignFromImagePickerControllerDidCaptureItemNotification];
  [self resignFromImagePickerControllerDidPressRetakeNotification];
}

#pragma mark - UserDidCaptureItem Notification handling

- (void)registerforImagePickerControllerDidCaptureNotification
{
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(imagePickerControllerUserDidCaptureItem) name:kImagePickerUserDidCaptureItemNotificationName object:nil];
}

- (void)resignFromImagePickerControllerDidCaptureItemNotification
{
  [[NSNotificationCenter defaultCenter] removeObserver:self name:kImagePickerUserDidCaptureItemNotificationName object:nil];
}

- (void)imagePickerControllerUserDidCaptureItem
{
  [self.delegate imagePickerControllerUserDidCaptureItem];
}

#pragma mark - UserDidRejectItem Notification handling

- (void)registerForImagePickerControllerDidPressRetakeNotification
{
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(imagePickerControllerUserDidPressRetake) name:kImagePickerUserDidRejectItemNotificationName object:nil];
}

- (void)resignFromImagePickerControllerDidPressRetakeNotification
{
  [[NSNotificationCenter defaultCenter] removeObserver:self name:kImagePickerUserDidRejectItemNotificationName object:nil];
}

- (void)imagePickerControllerUserDidPressRetake
{
  [self.delegate imagePickerControllerUserDidPressRetake];
}

@end
