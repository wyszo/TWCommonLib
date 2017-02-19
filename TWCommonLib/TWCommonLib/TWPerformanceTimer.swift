//  TWCommonLib

import UIKit

open class TWPerformanceTimer: NSObject {
  fileprivate var startDate : Date!
  fileprivate var timerName : NSString?
 
// MARK: init
  
  public override init() {
    super.init();
    self.start();
  }
  
  public convenience init(timerName : NSString) {
    self.init();
    self.timerName = timerName;
  }
  
// MARK: public 
  
  /**
  It's not required to call this method, if timer object exists, it'll call start at initialisation
  */
  open func start() {
    self.startDate = Date();
  }
  
  /**
  Finish measuring execution time, return and print time elapsed
  */
  open func stopAndLogTime() -> TimeInterval {
    let endDate = Date();
    let executionTime = endDate.timeIntervalSince(self.startDate!);

    self.logTime(executionTime);
    return executionTime;
  }
  
// MARK: private
  
  fileprivate func logTime(_ executionTime : TimeInterval) {
    let stringToLog = NSMutableString()
    
    if (self.timerName?.length != nil) {
      stringToLog.appendFormat("[Timer %@] ", self.timerName!);
    }
    stringToLog.append("Execution Time: \(executionTime)");

    print(stringToLog);
  }
}
