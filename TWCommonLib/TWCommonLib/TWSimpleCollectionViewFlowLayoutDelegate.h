//
//  TWCommonLib
//

#import <Foundation/Foundation.h>
#import "TWCommonMacros.h"
#import "TWCommonTypes.h"


/**
 Allows to control cellSize, binds it's lifetime to collectionView automatically, no need to keep a strong reference to it.
 */
@interface TWSimpleCollectionViewFlowLayoutDelegate : NSObject <UICollectionViewDelegateFlowLayout>

@property (nonatomic, copy) IndexPathBlock cellSelectedBlock;

NEW_AND_INIT_UNAVAILABLE
- (instancetype)initWithCellSize:(CGSize)cellSize collectionViewSize:(CGSize)collectionViewSize numberOfCells:(NSUInteger)numberOfCells attachingToCollectionView:(UICollectionView *)collectionView;

@end
