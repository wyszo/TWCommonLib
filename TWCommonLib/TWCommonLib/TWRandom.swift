//  TWCommonLib

import Foundation

public class TWRandom: NSObject {
  
  public func randomIntegerLessThan(maxInt : UInt) -> UInt {
    return ((UInt)(arc4random()) % maxInt);
  }
  
  public func randomBoolean() -> Bool {
    return ((arc4random() % 2) != 0);
  }
}
