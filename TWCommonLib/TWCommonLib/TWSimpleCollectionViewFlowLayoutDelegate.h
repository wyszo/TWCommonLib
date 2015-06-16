//
//  TWCommonLib
//

#import <Foundation/Foundation.h>
#import "TWCommonMacros.h"


/**
 Allows to control cellSize, binds it's lifetime to collectionView automatically, no need to keep a strong reference to it.
 */
@interface TWSimpleCollectionViewFlowLayoutDelegate : NSObject <UICollectionViewDelegateFlowLayout>

NEW_AND_INIT_UNAVAILABLE
- (instancetype)initWithCellSize:(CGSize)cellSize attachingToCollectionView:(UICollectionView *)collectionView;

@end
