//
//  TWCommonLib
//

#import "UIImage+TWCreateImage.h"
#import <KZAsserts/KZAsserts.h>
#import "TWCommonMacros.h"


@implementation UIImage (TWCreateImage)

+ (UIImage *)tw_createImageWithSize:(CGSize)size drawingBlock:(VoidBlock)drawingBlock
{
  AssertTrueOrReturnNil(drawingBlock);
  UIGraphicsBeginImageContext(size);
  
  CallBlock(drawingBlock);
  
  UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  
  return image;
}

@end
