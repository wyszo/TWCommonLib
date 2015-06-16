//
//  TWCommonLib
//

#import "TWSimpleCollectionViewDataSource.h"
#import "KZAsserts.h"
#import "NSObject+TWObjectLifetime.h"


@implementation TWSimpleCollectionViewDataSource

- (instancetype)initAttachingToCollectionView:(UICollectionView *)collectionView;
{
  AssertTrueOrReturnNil(collectionView);
  AssertTrueOrReturnNil(collectionView.dataSource == nil);
  
  self = [super init];
  if (self) {
    collectionView.dataSource = self;
    [self tw_bindLifetimeTo:collectionView];
  }
  return self;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
  return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
  return self.numberOfItems;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
  UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
  AssertTrueOrReturnNil(cell);
  CallBlock(self.cellConfigurationBlock, cell, indexPath);
  
  return cell;
}

@end
