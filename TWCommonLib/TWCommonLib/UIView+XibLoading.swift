import Foundation

extension UIView {
    public static func fromNibNamed(_ nibName: String) -> UIView? {
        let nibs = Bundle.main.loadNibNamed(nibName, owner: nil, options: nil)
        return nibs?[0] as? UIView
    }
}
