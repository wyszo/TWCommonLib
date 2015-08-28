@import Foundation;
#import "TWCommonMacros.h"
#import "TWCommonTypes.h"

/**
 Block-based ImagePicker delegate object.
 Gets destroyed automatically when image picker dismissed
 */
@interface TWImagePickerDelegate : NSObject <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic, copy) VoidBlockWithImage didSelectImageBlock;
@property (nonatomic, copy) VoidBlock didCancelBlock;

NEW_AND_INIT_UNAVAILABLE

- (instancetype)initBindingToObject:(NSObject *)parent;

@end
