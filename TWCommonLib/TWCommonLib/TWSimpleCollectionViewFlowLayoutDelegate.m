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
  AssertTrueOrReturnNil(collectionView.delegate == nil && @"Collection view delegate is already set - forbidding this as it's probably not expected nor desired");
  
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
