//  TWCommonLib

import UIKit

public class TWPerformanceTimer: NSObject {
  private var startDate : NSDate!
  private var timerName : NSString?
 
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
  public func start() {
    self.startDate = NSDate();
  }
  
  /**
  Finish measuring execution time, return and print time elapsed
  */
  public func stopAndLogTime() -> NSTimeInterval {
    let endDate = NSDate();
    let executionTime = endDate.timeIntervalSinceDate(self.startDate!);

    self.logTime(executionTime);
    return executionTime;
  }
  
// MARK: private
  
  private func logTime(executionTime : NSTimeInterval) {
    let stringToLog = NSMutableString()
    
    if (self.timerName?.length != nil) {
      stringToLog.appendFormat("[Timer %@] ", self.timerName!);
    }
    stringToLog.appendString("Execution Time: \(executionTime)");

    print(stringToLog);
  }
}
