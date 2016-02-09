import Foundation
import CoreData
import MagicalRecord

public class TWSingleCoreDataObjectFetchHelper<ManagedObjectType: NSManagedObject> {
  
  private var fetchedResultsController: NSFetchedResultsController?
  private var fetchedResultsControllerDelegate: NSFetchedResultsControllerDelegate?
  private var objectID: String
  private var objectIdPropertyName: String
  private var objectChangedCallback: () -> ()
  
  public var managedObject: ManagedObjectType?
    {
    get {
      assert(fetchedResultsController?.fetchedObjects?.count == 1, "core data fetch failed, should return exactly one object")
      let fetchedObject = fetchedResultsController?.fetchedObjects?[0]
      assert(fetchedObject is ManagedObjectType)
      return  fetchedObject as? ManagedObjectType
    }
  }
  
  required public init(objectIdPropertyName: String, objectID: String, objectChanged: ()->()) {
    self.objectID = objectID
    self.objectIdPropertyName = objectIdPropertyName
    self.objectChangedCallback = objectChanged
    setupFetchedResultsController()
  }
  
  // MARK: Private
  
  private func setupFetchedResultsController() {
    
    func createFetchRequest(objectIdPropertyName: String, objectID: String) -> NSFetchRequest {
      let predicate = NSPredicate(format: "%K == %ld", objectIdPropertyName, Int(objectID)!) // TODO: jesli to zostawie na incie, to bede musial pozmieniac typy!!
      let fetchRequest: NSFetchRequest = ManagedObjectType.MR_requestAllWithPredicate(predicate)
      fetchRequest.sortDescriptors = [ NSSortDescriptor(key: objectIdPropertyName, ascending: true) ]
      return fetchRequest
    }
    let fetchRequest = createFetchRequest(objectIdPropertyName, objectID: objectID)
    
    fetchedResultsControllerDelegate = TWFetchResultsControllerAnyObjectChangedNotifier(objectChanged: self.objectChangedCallback)
    let context = NSManagedObjectContext.MR_defaultContext()
    
    fetchedResultsController = ManagedObjectType.MR_fetchController(fetchRequest, delegate: fetchedResultsControllerDelegate, useFileCache:false, groupedBy: nil, inContext:context)
    do {
      try fetchedResultsController?.performFetch()
    } catch {
      assert(false, "core data fetch failed!")
    }
    assert(self.managedObject != nil)
  }
}
