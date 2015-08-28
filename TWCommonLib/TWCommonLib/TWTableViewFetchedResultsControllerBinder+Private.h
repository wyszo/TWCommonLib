//
//  TWCommonLib
//

#import "TWTableViewFetchedResultsControllerBinder.h"
@import UIKit;


typedef NSIndexPath* (^IndexPathTransformBlock)(NSIndexPath *indexPath);


@interface TWTableViewFetchedResultsControllerBinder (Private)

/**
 Binder won't process any updates while this flag is set to true. Useful for processing user-driven changes
 */
@property (nonatomic, assign) BOOL disabled;

/**
 One can have a tableView with some sections backed in CoreData and other sections loaded from memory. We need to apply a transformation on indexPaths before performing operations on them, otherwise we'll get indexes mismatch and a crash
 */
@property (copy, nonatomic) IndexPathTransformBlock indexPathTransformBlock;

@end