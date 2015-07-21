#import "TWImagePickerDelegate.h"
#import <KZAsserts.h>
#import "NSObject+TWObjectLifetime.h"

@interface TWImagePickerDelegate ()
@property (nonatomic, weak) NSObject *owner;
@end

@implementation TWImagePickerDelegate

- (instancetype)initBindingToObject:(NSObject *)parent
{
  AssertTrueOrReturnNil(parent);
  if ((self = [super init])) {
    [self bindLifecycleTo:parent];
  }
  return self;
}

- (void)bindLifecycleTo:(NSObject *)parent
{
  AssertTrueOrReturn(parent);
  self.owner = parent;
  [self tw_bindLifetimeTo:parent];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
  UIImage *image = info[UIImagePickerControllerOriginalImage];
  CallBlock(self.didSelectImageBlock, image);
  
  if (self.owner) {
    [self tw_releaseLifetimeDependencyFrom:self.owner];
  }
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
  CallBlock(self.didCancelBlock);
  if (self.owner) {
    [self tw_releaseLifetimeDependencyFrom:self.owner];
  }
}

@end
