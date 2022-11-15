/// Created by Harrison Hall & Carl Show on 11/14/22.
import UIKit
class ViewController: UIViewController
{
    @IBOutlet weak var misAssignments: UITabBarItem!
    var isLogged = false
    @IBOutlet weak var calHiearchy: UITabBarItem!
    @IBOutlet weak var UpAssign: UITabBarItem!
    @IBOutlet weak var loginButton: UIButton!
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    @IBAction func Login(_ sender: Any)
    {
        var name = ""
        var pass = ""
        let err = UIAlertController(title: "Enter the following information to log in...", message: "", preferredStyle: .alert)
        err.addTextField{(textField) in
            textField.placeholder = "Name"}
        err.addTextField{(textField) in
            textField.placeholder = "Password"}
        err.addAction(UIAlertAction(title: "Submit", style: .default, handler: { alert -> Void in
            name = err.textFields![0].text ?? "Unknown"
            pass = err.textFields![1].text ?? "Empty"
            if(name == "debugDan" && pass == "123")
            {
                self.isLogged = true
            }
        }))
        err.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(err, animated: true, completion: nil)
    }
    func updateAll()
    {
        if(isLogged)
        {
            loginButton.isHidden = true
            UpAssign.isEnabled = true
            calHiearchy.isEnabled = true
            misAssignments.isEnabled = true
        }
    }
}
