//  TWCommonLib

import Foundation

open class TWRandom: NSObject {
  
  open func randomIntegerLessThan(_ maxInt : UInt) -> UInt {
    return ((UInt)(arc4random()) % maxInt);
  }
  
  open func randomBoolean() -> Bool {
    return ((arc4random() % 2) != 0);
  }
}
