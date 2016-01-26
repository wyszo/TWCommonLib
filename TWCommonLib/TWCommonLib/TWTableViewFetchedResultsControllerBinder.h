//
//  TWCommonLib
//

@import CoreData;
#import "TWCommonMacros.h"
#import "TWCommonTypes.h"

/**
 A class that detects changes in FetchedResultsController and updates TableView based on them
 */
@interface TWTableViewFetchedResultsControllerBinder : NSObject <NSFetchedResultsControllerDelegate>

@property (copy, nonatomic) void (^numberOfObjectsChangedBlock)(NSInteger objectCount);

// Deprecated, use objectInsertedAtIndexPathExtendedBlock instead
@property (copy, nonatomic) IndexPathBlock objectInsertedAtIndexPathBlock DEPRECATED_ATTRIBUTE; // deprecated
@property (copy, nonatomic) IndexPathWithObjectBlock objectInsertedAtIndexPathExtendedBlock;

NEW_AND_INIT_UNAVAILABLE

/**
 @param configureCellBlock  A block that will be called if dataModel object for item changed (and NSFetchedResultsController got NSFetchedResultsChangeUpdate change notification)
 // TODO: introduce (id)object parametr to configureCellBlock (we can ask the dataSource for the object) 
 */
- (instancetype)initWithTableView:(UITableView *)tableView
               configureCellBlock:(void (^)(UITableViewCell *cell, NSIndexPath *indexPath))configureCellBlock;

@end
