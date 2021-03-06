//
//  TWCommonLib
//

@import KZAsserts;
#import "TWTableViewFetchedResultsControllerBinder+Private.h"

@interface TWTableViewFetchedResultsControllerBinder ()
@property (weak, nonatomic) UITableView *tableView;
@property (copy, nonatomic) void (^configureCellBlock)(UITableViewCell *cell, NSIndexPath *indexPath);
@property (nonatomic, assign) BOOL disabled;
@property (copy, nonatomic) IndexPathTransformBlock indexPathTransformBlock;
@property (strong, nonatomic) NSMutableArray *deletedSections;
@property (strong, nonatomic) NSMutableArray *insertedSections;
@end

@implementation TWTableViewFetchedResultsControllerBinder

#pragma mark - Initialization

- (instancetype)initWithTableView:(UITableView *)tableView configureCellBlock:(void (^)(UITableViewCell *, NSIndexPath *))configureCellBlock
{
  AssertTrueOrReturnNil(tableView);
  AssertTrueOrReturnNil(configureCellBlock);
  self = [super init];
  if (self) {
    _tableView = tableView;
    _configureCellBlock = configureCellBlock;
    _deletedSections = [NSMutableArray new];
    _insertedSections = [NSMutableArray new];
  }
  return self;
}

#pragma mark - NSFetchedResultsControllerDelegate

// original (heavlily modified) source: http://samwize.com/2014/03/29/implementing-nsfetchedresultscontroller-with-magicalrecord/

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath
{
  if (self.disabled) {
    return;
  }
  
  UITableView *tableView = self.tableView;
  AssertTrueOrReturn(tableView);
  
  indexPath = [self indexPathAfterTransformation:indexPath];
  newIndexPath = [self indexPathAfterTransformation:newIndexPath];
  
  void (^callConfigureCellAtIndexPathCallback)(NSIndexPath * _Nonnull) = ^(NSIndexPath * _Nonnull indexPath) {
    // safe to use self in this block, since it's not persisted
    if (self.configureCellBlock) {
      UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
      if (cell) {
        self.configureCellBlock(cell, indexPath);
      } else {
        // FetchedResultsController of a tableView from other tabBar item (now invisible) got the update, but didn't return a new cell when asked (since it's invisible). Expected case, don't worry.
      }
    }
  };
  
  switch(type) {
    case NSFetchedResultsChangeInsert: {
      AssertTrueOrReturn(newIndexPath);
      
      [tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
      
      VoidBlock invokeCallbacks = ^{
        // if changes animated, all those blocks will be invoked when animation ends
        CallBlock(self.objectInsertedAtIndexPathBlock, newIndexPath); 
        CallBlock(self.objectInsertedAtIndexPathExtendedBlock, newIndexPath, anObject);
      };
      
      [self invokeNumberOfObjectsChangedCallbackForController:controller];
      
      if ([self useCATransactionAPI]) {
        // for now we just have one completion block - if we wanted more, we'd have to chain them
        [CATransaction setCompletionBlock:^{
          invokeCallbacks();
        }];
      } else {
        invokeCallbacks();
      }
    } break;
      
    case NSFetchedResultsChangeDelete: {
      AssertTrueOrReturn(indexPath);
      [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
      [self invokeNumberOfObjectsChangedCallbackForController:controller];
    } break;
      
    case NSFetchedResultsChangeUpdate: {
      // Beware - apart from cell content, index path could also have changed (despite getting ChangeUpdate instead of ChangeMove). Use newIndexPath in here! (if it exists)
      NSIndexPath *updateIndexPath = newIndexPath;
      if (!updateIndexPath) {
        // This is another case - sometimes newIndexPath is nil and only IndexPath is set
        updateIndexPath = indexPath;
      }
      AssertTrueOrReturn(updateIndexPath);
      callConfigureCellAtIndexPathCallback(updateIndexPath);
    } break;
      
    case NSFetchedResultsChangeMove: {
      AssertTrueOrReturn(indexPath);
      AssertTrueOrReturn(newIndexPath);
      
      if (![indexPath isEqual:newIndexPath]) {
        BOOL noSectionChanges = (![self indexPathInDeletedOrInsertedSections:indexPath] && ![self indexPathInDeletedOrInsertedSections:newIndexPath]);
      
        if (noSectionChanges) {
          [tableView moveRowAtIndexPath:indexPath toIndexPath:newIndexPath];
        } else {
          // if we have just added or deleted a section, we'd get a crash if we tried to execute move in the same run
          [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
          [tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        }
      }
      else { // old and new indexPaths are equal
        if ([self.deletedSections containsObject:@(indexPath.section)]) { // cell used to be in a section that has just been deleted
          [tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
          // note that insertion callbacks are not called in this case (since cell has already been in the tableView, just moved)
        } else {
          // Note that sometimes on iOS9 we get a ResultChangeMove instead of Update - with the same old and new indexPath - iOS9 bug
          // (current else statement captures this case)
        }
      }

      // no matter if we got a proper move action or update (due to a bug described above), we want to update cell UI
      callConfigureCellAtIndexPathCallback(indexPath);
      callConfigureCellAtIndexPathCallback(newIndexPath);
    } break;
  }
}

- (BOOL)indexPathInDeletedOrInsertedSections:(NSIndexPath *)indexPath {
  AssertTrueOrReturnNo(indexPath);

  BOOL inDeleted = [self.deletedSections containsObject:@(indexPath.section)];
  BOOL inInserted = [self.insertedSections containsObject:@(indexPath.section)];

  return (inDeleted || inInserted);
}

- (void)invokeNumberOfObjectsChangedCallbackForController:(NSFetchedResultsController *)fetchedResultsController
{
  if (self.numberOfObjectsChangedBlock) {
    self.numberOfObjectsChangedBlock(fetchedResultsController.fetchedObjects.count);
  }
}

- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id <NSFetchedResultsSectionInfo>)sectionInfo atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type
{
  if (self.disabled) {
    return;
  }
  
  UITableView *tableView = self.tableView;
  AssertTrueOrReturn(tableView);
  
  sectionIndex = [self sectionIndexAfterTransformation:sectionIndex];
  AssertTrueOrReturn(sectionIndex >= 0);
  
  switch(type) {
    case NSFetchedResultsChangeInsert: {
      [tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex]
               withRowAnimation:UITableViewRowAnimationFade];
      [self.insertedSections addObject:@(sectionIndex)];
    } break;
      
    case NSFetchedResultsChangeDelete: {
      [tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex]
               withRowAnimation:UITableViewRowAnimationFade];
      [self.deletedSections addObject:@(sectionIndex)];
    } break;
      
    case NSFetchedResultsChangeMove:
    case NSFetchedResultsChangeUpdate:
      break;
  }
}

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller
{
  if (self.disabled) {
    return;
  }
  
  if ([self useCATransactionAPI]) {
    [CATransaction begin];
  }
  
  [self.tableView beginUpdates];
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
  [self.deletedSections removeAllObjects];
  [self.insertedSections removeAllObjects];

  if (self.disabled) {
    return;
  }
  [self.tableView endUpdates];
  
  if ([self useCATransactionAPI]) {
    [CATransaction commit];
  }
}

#pragma mark - Auxiliary methods

- (BOOL)useCATransactionAPI
{
  return (self.objectInsertedAtIndexPathBlock != nil || self.objectInsertedAtIndexPathExtendedBlock != nil);
}

- (NSIndexPath *)indexPathAfterTransformation:(NSIndexPath *)indexPath {
    if (!self.indexPathTransformBlock) {
        return indexPath;
    }
    
    NSIndexPath *transformedIndexPath = self.indexPathTransformBlock(indexPath);
    if (indexPath) {
        AssertTrueOr(transformedIndexPath && @"indexPath should not be nil after transformation!", return indexPath;);
    }
    return transformedIndexPath;
}

- (NSInteger)sectionIndexAfterTransformation:(NSInteger)sectionIndex {
    if (!self.indexPathTransformBlock) {
        return sectionIndex;
    }
    
    NSIndexPath *dummyIndexPath = [NSIndexPath indexPathForRow:0 inSection:sectionIndex];
    dummyIndexPath = [self indexPathAfterTransformation:dummyIndexPath];
    return dummyIndexPath.section;
}

@end
