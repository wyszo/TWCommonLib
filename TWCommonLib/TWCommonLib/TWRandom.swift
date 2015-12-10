//  TWCommonLib

import Foundation

class TWRandom: NSObject {
  
  func randomIntegerLessThan(maxInt : UInt) -> UInt {
    return ((UInt)(arc4random()) % maxInt);
  }
  
  func randomBoolean() -> Bool {
    return ((arc4random() % 2) != 0);
  }
}
