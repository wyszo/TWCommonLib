import Foundation
import CoreData

@objc
open class TWFetchResultsControllerAnyObjectChangedNotifier: NSObject, NSFetchedResultsControllerDelegate {
  fileprivate var anyObjectChanged: () -> ()
  
  required public init(objectChanged: @escaping () -> ()) {
    anyObjectChanged = objectChanged
  }
  
  // MARK: FRC delegate
  
  open func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
    // place a breakpoint in here to understand what happens behind the scenes
  }
  
  open func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
    anyObjectChanged()
  }
}
