import UIKit

extension UIAlertController {
    func tw_addSegueActions(fromViewController viewController: UIViewController, actionTitleToSegueIdentifierMapping mapping: [(_: String, _: String)]) {
        for (title, segueIdentifier) in mapping {
            assert(title.characters.count > 0)
            assert(segueIdentifier.characters.count > 0)
            
            self.addAction(UIAlertAction(title: title, style: .default, handler: { action in
                viewController.performSegue(withIdentifier: segueIdentifier, sender: viewController)
            }))
        }
    }
}
