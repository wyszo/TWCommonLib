//
//  TWCommonLib
//

#import <Foundation/Foundation.h>
#import "TWCommonMacros.h"
#import "TWCommonTypes.h"


/**
 Simple dataSource for collectionView with only one section. DataSource will live as long as the collectionView is alive, no need to keep a strong reference to it.
 */
@interface TWSimpleCollectionViewDataSource : NSObject <UICollectionViewDataSource>

@property (nonatomic, assign) NSInteger numberOfItems;
@property (nonatomic, strong) CollectionViewCellAtIndexPathBlock cellConfigurationBlock;

NEW_AND_INIT_UNAVAILABLE
- (instancetype)initAttachingToCollectionView:(UICollectionView *)collectionView;

@end
