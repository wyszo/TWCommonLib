import Foundation

public func DispatchAfter(_ time: Double, closure: @escaping ()->()) {
    let delayTime = DispatchTime.now() + Double(Int64(time * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
    DispatchQueue.main.asyncAfter(deadline: delayTime, execute: closure)
}

public func DispatchSyncOnMainThread(_ closure: ()->()) {
    if Thread.isMainThread {
        closure()
    } else {
        DispatchQueue.main.sync(execute: closure)
    }
}

public func DispatchAsyncOnMainThread(_ closure: @escaping ()->()) {
  DispatchQueue.main.async(execute: closure)
}
