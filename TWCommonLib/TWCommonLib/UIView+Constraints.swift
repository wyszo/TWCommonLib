import UIKit

public extension UIView {
    func makeEqualSize(toView view: UIView) {
        if #available(iOS 9.0, *) {
            widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
            heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        } else {
            assertionFailure("api not supported in this iOS version")
        }
    }
  
    func center(withView view: UIView) {
        if #available(iOS 9.0, *) {
            centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        }
        else {
            assertionFailure("api not supported in this iOS version")
        }
    }
}
