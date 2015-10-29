//
//  TWCommonLib
//

#import "TWTableViewFetchedResultsControllerBinder+Private.h"
#import <KZAsserts/KZAsserts.h>


@interface TWTableViewFetchedResultsControllerBinder ()

@property (weak, nonatomic) UITableView *tableView;
@property (copy, nonatomic) void (^configureCellBlock)(UITableViewCell *cell, NSIndexPath *indexPath);
@property (nonatomic, assign) BOOL disabled;
@property (copy, nonatomic) IndexPathTransformBlock indexPathTransformBlock;

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
  }
  return self;
}

#pragma mark - NSFetchedResultsControllerDelegate

// source: http://samwize.com/2014/03/29/implementing-nsfetchedresultscontroller-with-magicalrecord/


- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath
{
  if (self.disabled) {
    return;
  }
  
  UITableView *tableView = self.tableView;
  AssertTrueOrReturn(tableView);
  
  if (self.indexPathTransformBlock) {
    NSIndexPath *indexPathBeforeTransformation = indexPath;
    indexPath = self.indexPathTransformBlock(indexPath);
    if (indexPathBeforeTransformation) {
      AssertTrueOrReturn(indexPath && @"indexPath should not be nil after transformation!");
    }
    
    NSIndexPath *newIndexPathBeforeTransformation = newIndexPath;
    newIndexPath = self.indexPathTransformBlock(newIndexPath);
    if (newIndexPathBeforeTransformation) {
      AssertTrueOrReturn(newIndexPath && @"newIndexPath should not be nil after transformation!");
    }
  }
  
  switch(type) {
    case NSFetchedResultsChangeInsert: {
      AssertTrueOrReturn(newIndexPath);
      
      [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath]
                       withRowAnimation:UITableViewRowAnimationFade];
      
      if ([self useCATransactionAPI]) {
        // for now we just have one completion block - if we wanted more, we'd have to chain them
        [CATransaction setCompletionBlock:^{
          CallBlock(self.objectInsertedAtIndexPathBlock, newIndexPath); // will be called after all the UI changes finished animating
        }];
      }
      [self invokeNumberOfObjectsChangedCallbackForController:controller];
    } break;
      
    case NSFetchedResultsChangeDelete: {
      AssertTrueOrReturn(indexPath);
      [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                       withRowAnimation:UITableViewRowAnimationFade];
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
      
      if (self.configureCellBlock) {
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:updateIndexPath];
        if (cell) {
          self.configureCellBlock(cell, updateIndexPath);
        } else {
          // FetchedResultsController of a tableView from other tabBar item (now invisible) got the update, but didn't return a new cell when asked (since it's invisible). Expected case, don't worry.
        }
      }
    } break;
      
    case NSFetchedResultsChangeMove: {
      AssertTrueOrReturn(indexPath);
      AssertTrueOrReturn(newIndexPath);
      
      if (![indexPath isEqual:newIndexPath]) {
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                         withRowAnimation:UITableViewRowAnimationFade];
        [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath]
                         withRowAnimation:UITableViewRowAnimationFade];
      }
    } break;
  }
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
  
  switch(type) {
    case NSFetchedResultsChangeInsert: {
      [tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex]
               withRowAnimation:UITableViewRowAnimationFade];
    } break;
      
    case NSFetchedResultsChangeDelete: {
      [tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex]
               withRowAnimation:UITableViewRowAnimationFade];
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
  return (self.objectInsertedAtIndexPathBlock != nil);
}

@end
