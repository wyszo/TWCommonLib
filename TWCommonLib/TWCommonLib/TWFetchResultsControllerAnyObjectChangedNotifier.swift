import Foundation
import CoreData

@objc
public class TWFetchResultsControllerAnyObjectChangedNotifier: NSObject, NSFetchedResultsControllerDelegate {
  private var anyObjectChanged: () -> ()
  
  required public init(objectChanged: () -> ()) {
    anyObjectChanged = objectChanged
  }
  
  // MARK: FRC delegate
  
  public func controller(controller: NSFetchedResultsController, didChangeObject anObject: AnyObject, atIndexPath indexPath: NSIndexPath?, forChangeType type: NSFetchedResultsChangeType, newIndexPath: NSIndexPath?) {
    // place a breakpoint in here to understand what happens behind the scenes
  }
  
  public func controllerDidChangeContent(controller: NSFetchedResultsController) {
    anyObjectChanged()
  }
}