//
//  TWCommonLib
//

#import "TWDataWriteHelper.h"
#import "NSObject+TWObjectLifetime.h"
#import "TWCommonMacros.h"
#import <KZAsserts/KZAsserts.h>


@interface TWDataWriteHelper ()
@property (nonatomic, copy) BlockWithBoolParameter completionBlock;
@end


@implementation TWDataWriteHelper

- (void)writeImageToSavedPhotosAlbum:(UIImage *)image completion:(BlockWithBoolParameter)completion
{
  AssertTrueOrReturn(image);
  id target = nil;
  SEL selector = nil;
  
  if (completion) {
    target = self;
    selector = @selector(image:didFinishSavingWithError:contextInfo:);
    
    self.completionBlock = completion;
    [self tw_bindLifetimeTo:[UIApplication sharedApplication]];
  }
  UIImageWriteToSavedPhotosAlbum(image, target, selector, nil);
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
  [self tw_releaseLifetimeDependencyFrom:[UIApplication sharedApplication]];
  BOOL success = (error == nil);
  CallBlock(self.completionBlock, success);
}

@end
