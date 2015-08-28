//
//  TWCommonLib
//

#import "TWSimpleCollectionViewFlowLayoutDelegate.h"
#import <KZAsserts.h>
#import "NSObject+TWObjectLifetime.h"


static const CGFloat kMinimumInteritemSpacingFromSDK = 10.0f;


@interface TWSimpleCollectionViewFlowLayoutDelegate ()
@property (nonatomic, assign) CGSize cellSize;
@property (nonatomic, assign) CGSize collectionViewSize;
@property (nonatomic, assign) NSUInteger numberOfCells;
@end


@implementation TWSimpleCollectionViewFlowLayoutDelegate

- (instancetype)initWithCellSize:(CGSize)cellSize collectionViewSize:(CGSize)collectionViewSize numberOfCells:(NSUInteger)numberOfCells attachingToCollectionView:(UICollectionView *)collectionView
{
  AssertTrueOrReturnNil(collectionView);
  AssertTrueOrReturnNil(collectionView.delegate == nil && @"Collection view delegate is already set - forbidding this as it's probably not expected nor desired");
  
  self = [super init];
  if (self) {
    _cellSize = cellSize;
    _collectionViewSize = collectionViewSize;
    _numberOfCells = numberOfCells;
    collectionView.delegate = self;
    [self tw_bindLifetimeTo:collectionView];
  }
  return self;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
  return CGSizeMake(self.cellSize.width, self.cellSize.height);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
  CallBlock(self.cellSelectedBlock, indexPath);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
  AssertTrueOr(self.numberOfCells, return UIEdgeInsetsZero;);
  
  // Center all items
  CGFloat cellsWithInteritemSpacingWidth = self.numberOfCells * (self.cellSize.width + kMinimumInteritemSpacingFromSDK);
  NSInteger edgeInsets = (self.collectionViewSize.width - cellsWithInteritemSpacingWidth) / (self.numberOfCells + 1);
  return UIEdgeInsetsMake(0, edgeInsets, 0, edgeInsets);
}

@end
