import UIKit

enum ScrollHandlingDelegateError : ErrorType {
  case TableViewFooterMissingError
}

/**
 Sets the tableView delegate to itself and then notifies when tableView footer becomes visible or is scrolled out of a visible area
 */
public class TWTableViewScrollHandlingDelegate: NSObject, UITableViewDelegate {
  
  private var footerVisibleValue : Bool
  private var tableView : UITableView
  
  private var tableViewDelegates : LBDelegateMatrioska?
  
  public var didScrollToFooter: (()->Void)?
  public var didScrollAboveFooter: (()->Void)?
  
  public init(tableView : UITableView, fallbackDelegate : UITableViewDelegate) throws {
    self.tableView = tableView
    self.footerVisibleValue = false
    
    super.init()
    self.tableViewDelegates = LBDelegateMatrioska.init(delegates: [fallbackDelegate, self])
    self.tableView.delegate = self.tableViewDelegates as? UITableViewDelegate
    
    guard let _ = tableView.tableFooterView else {
      throw ScrollHandlingDelegateError.TableViewFooterMissingError
    }
  }
  
  /**
   Forces updating internal state. You might want to call this for example from viewDidAppear if you need to ensure correct state before user did scroll
   */
  public func updateFooterVisibleValue() {
    if let visible = try? isFooterViewVisible() {
      footerVisibleValue = visible
    }
  }
  
  // MARK: UITableViewDelegate
  
  public func scrollViewDidScroll(scrollView: UIScrollView) {
    checkDidScrollToFooter()
    checkDidScrollAboveFooter()
  }
  
  // MARK: private
  
  private func checkDidScrollToFooter() {
    let footerVisible = try? isFooterViewVisible()
    
    if !footerVisibleValue && footerVisible == true {
      footerVisibleValue = true
      didScrollToFooter?()
    }
  }
  
  private func checkDidScrollAboveFooter() {
    let footerVisible = try? isFooterViewVisible()
    
    if footerVisibleValue && footerVisible == false {
      footerVisibleValue = false
      didScrollAboveFooter?()
    }
  }
  
  private func isFooterViewVisible() throws -> Bool {
    let currentBottomOffset = tableView.contentOffset.y + tableView.frame.size.height
    
    guard let footerView = tableView.tableFooterView else {
      throw ScrollHandlingDelegateError.TableViewFooterMissingError
    }
    let footerOffset = footerView.frame.origin.y
    
    return (currentBottomOffset >= footerOffset)
  }
}
