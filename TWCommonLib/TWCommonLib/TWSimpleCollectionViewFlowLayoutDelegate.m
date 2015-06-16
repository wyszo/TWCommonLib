//
//  TWCommonLib
//

#import "TWSimpleCollectionViewFlowLayoutDelegate.h"
#import "KZAsserts.h"
#import "NSObject+TWObjectLifetime.h"


@interface TWSimpleCollectionViewFlowLayoutDelegate ()
@property (nonatomic, assign) CGSize cellSize;
@end


@implementation TWSimpleCollectionViewFlowLayoutDelegate

- (instancetype)initWithCellSize:(CGSize)cellSize attachingToCollectionView:(UICollectionView *)collectionView
{
  AssertTrueOrReturnNil(collectionView);
  AssertTrueOrReturnNil(collectionView.delegate == nil);
  
  self = [super init];
  if (self) {
    _cellSize = cellSize;
    collectionView.delegate = self;
    [self tw_bindLifetimeTo:collectionView];
  }
  return self;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
  return CGSizeMake(self.cellSize.width, self.cellSize.height);
}

@end
