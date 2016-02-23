import Foundation

public func DispatchAfter(time: Double, closure: ()->()) {
    let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(time * Double(NSEC_PER_SEC)))
    dispatch_after(delayTime, dispatch_get_main_queue(), closure)
}

public func DispatchSyncOnMainThread(closure: ()->()) {
    if NSThread.isMainThread() {
        closure()
    } else {
        dispatch_sync(dispatch_get_main_queue(), closure)
    }
}

public func DispatchAsyncOnMainThread(closure: ()->()) {
  dispatch_async(dispatch_get_main_queue(), closure)
}
