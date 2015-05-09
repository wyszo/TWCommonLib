//
//  TWCommonLib
//

#import <UIKit/UIKit.h>
#import "TWCommonTypes.h"


@interface UIImage (TWCreateImage)

+ (UIImage *)tw_createImageWithSize:(CGSize)size drawingBlock:(VoidBlock)drawingBlock;

@end
