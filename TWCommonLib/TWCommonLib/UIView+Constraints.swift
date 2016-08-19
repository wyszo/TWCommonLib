import UIKit

public extension UIView {
    func makeEqualSize(toView view: UIView) {
        if #available(iOS 9.0, *) {
            widthAnchor.constraintEqualToAnchor(view.widthAnchor).active = true
            heightAnchor.constraintEqualToAnchor(view.heightAnchor).active = true
        } else {
            assertionFailure("api not supported in this iOS version")
        }
    }
  
    func center(withView view: UIView) {
        if #available(iOS 9.0, *) {
            centerXAnchor.constraintEqualToAnchor(view.centerXAnchor).active = true
            centerYAnchor.constraintEqualToAnchor(view.centerYAnchor).active = true
        }
        else {
            assertionFailure("api not supported in this iOS version")
        }
    }
}
