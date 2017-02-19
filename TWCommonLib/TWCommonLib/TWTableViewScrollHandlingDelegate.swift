import UIKit

enum ScrollHandlingDelegateError : Error {
  case tableViewFooterMissingError
}

/**
 Sets the tableView delegate to itself and then notifies when tableView footer becomes visible or is scrolled out of a visible area
 */
open class TWTableViewScrollHandlingDelegate: NSObject, UITableViewDelegate {
  
  fileprivate var footerVisibleValue : Bool
  fileprivate var tableView : UITableView
  
  fileprivate var tableViewDelegates : LBDelegateMatrioska?
  
  open var didScrollToFooter: (()->Void)?
  open var didScrollAboveFooter: (()->Void)?
  
  public init(tableView : UITableView, fallbackDelegate : UITableViewDelegate) throws {
    self.tableView = tableView
    self.footerVisibleValue = false
    
    super.init()
    self.tableViewDelegates = LBDelegateMatrioska.init(delegates: [fallbackDelegate, self])
    self.tableView.delegate = self.tableViewDelegates as? UITableViewDelegate
    
    guard let _ = tableView.tableFooterView else {
      throw ScrollHandlingDelegateError.tableViewFooterMissingError
    }
  }
  
  /**
   Forces updating internal state. You might want to call this for example from viewDidAppear if you need to ensure correct state before user did scroll
   */
  open func updateFooterVisibleValue() {
    if let visible = try? isFooterViewVisible() {
      footerVisibleValue = visible
    }
  }
  
  // MARK: UITableViewDelegate
  
  open func scrollViewDidScroll(_ scrollView: UIScrollView) {
    checkDidScrollToFooter()
    checkDidScrollAboveFooter()
  }
  
  // MARK: private
  
  fileprivate func checkDidScrollToFooter() {
    let footerVisible = try? isFooterViewVisible()
    
    if !footerVisibleValue && footerVisible == true {
      footerVisibleValue = true
      didScrollToFooter?()
    }
  }
  
  fileprivate func checkDidScrollAboveFooter() {
    let footerVisible = try? isFooterViewVisible()
    
    if footerVisibleValue && footerVisible == false {
      footerVisibleValue = false
      didScrollAboveFooter?()
    }
  }
  
  fileprivate func isFooterViewVisible() throws -> Bool {
    let currentBottomOffset = tableView.contentOffset.y + tableView.frame.size.height
    
    guard let footerView = tableView.tableFooterView else {
      throw ScrollHandlingDelegateError.tableViewFooterMissingError
    }
    let footerOffset = footerView.frame.origin.y
    
    return (currentBottomOffset >= footerOffset)
  }
}
