//
//  TWCommonLib
//

#import "TWTableViewFetchedResultsControllerBinder+Private.h"
#import <KZAsserts.h>


@interface TWTableViewFetchedResultsControllerBinder ()

@property (weak, nonatomic) UITableView *tableView;
@property (copy, nonatomic) void (^configureCellBlock)(UITableViewCell *cell, NSIndexPath *indexPath);
@property (nonatomic, assign) BOOL disabled;

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
  
  switch(type) {
      
    case NSFetchedResultsChangeInsert: {
      [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath]
                       withRowAnimation:UITableViewRowAnimationFade];
      [self invokeNumberOfObjectsChangedCallbackForController:controller];
    } break;
      
    case NSFetchedResultsChangeDelete: {
      [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                       withRowAnimation:UITableViewRowAnimationFade];
      [self invokeNumberOfObjectsChangedCallbackForController:controller];
    } break;
      
    case NSFetchedResultsChangeUpdate: {
      if (self.configureCellBlock) {
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        if (cell) {
          self.configureCellBlock(cell, indexPath);
        } else {
          // FetchedResultsController of a tableView from other tabBar item (now invisible) got the update, but didn't return a new cell when asked (since it's invisible). Expected case, don't worry.
        }
      }
    } break;
      
    case NSFetchedResultsChangeMove: {
      [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                       withRowAnimation:UITableViewRowAnimationFade];
      [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath]
                       withRowAnimation:UITableViewRowAnimationFade];
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
  [self.tableView beginUpdates];
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
  if (self.disabled) {
    return;
  }
  [self.tableView endUpdates];
}

@end
