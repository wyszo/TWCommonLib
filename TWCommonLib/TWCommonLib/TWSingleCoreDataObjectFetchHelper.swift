import Foundation
import CoreData
import MagicalRecord

open class TWSingleCoreDataObjectFetchHelper<ManagedObjectType: NSManagedObject> {
  
  fileprivate var fetchedResultsController: NSFetchedResultsController<NSFetchRequestResult>?
  fileprivate var fetchedResultsControllerDelegate: NSFetchedResultsControllerDelegate?
  fileprivate var objectID: Int
  fileprivate var objectIdPropertyName: String
  fileprivate var objectChangedCallback: () -> ()
  
  open var managedObject: ManagedObjectType?
    {
    get {
      assert(fetchedResultsController?.fetchedObjects?.count == 1, "core data fetch failed, should return exactly one object")
      let fetchedObject = fetchedResultsController?.fetchedObjects?[0]
      assert(fetchedObject is ManagedObjectType)
      return  fetchedObject as? ManagedObjectType
    }
  }
  
  required public init(objectIdPropertyName: String, objectID: Int, objectChanged: @escaping ()->()) {
    self.objectID = objectID
    self.objectIdPropertyName = objectIdPropertyName
    self.objectChangedCallback = objectChanged
    setupFetchedResultsController()
  }
  
  // MARK: Private
  
  fileprivate func setupFetchedResultsController() {
    
    func createFetchRequest(_ objectIdPropertyName: String, objectID: Int) -> NSFetchRequest<NSFetchRequestResult> {
      let predicate = NSPredicate(format: "%K == %ld", objectIdPropertyName, objectID)
      let fetchRequest: NSFetchRequest = ManagedObjectType.mr_requestAll(with: predicate)
      fetchRequest.sortDescriptors = [ NSSortDescriptor(key: objectIdPropertyName, ascending: true) ]
      return fetchRequest
    }
    let fetchRequest = createFetchRequest(objectIdPropertyName, objectID: objectID)
    
    fetchedResultsControllerDelegate = TWFetchResultsControllerAnyObjectChangedNotifier(objectChanged: self.objectChangedCallback)
    let context = NSManagedObjectContext.mr_default()
    
    fetchedResultsController = ManagedObjectType.mr_fetchController(fetchRequest, delegate: fetchedResultsControllerDelegate, useFileCache:false, groupedBy: nil, in:context)
    do {
      try fetchedResultsController?.performFetch()
    } catch {
      assert(false, "core data fetch failed!")
    }
    assert(self.managedObject != nil)
  }
}
