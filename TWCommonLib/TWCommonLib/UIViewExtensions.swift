import Foundation

extension UIView {
    public static func fromNibNamed(nibName: String) -> UIView? {
        let nibs = NSBundle.mainBundle().loadNibNamed(nibName, owner: nil, options: nil)
        return nibs[0] as? UIView
    }
}