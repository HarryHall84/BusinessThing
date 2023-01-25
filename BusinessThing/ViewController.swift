/// Created by Harrison Hall & Carl Show on 11/14/22.
import UIKit
class ViewController: UIViewController
{
    var isLogged = false
    static var basicSet = [("English Assignment", 0, "Mar 5"), ("AP Gov Project", 60, "Apr 2"), ("Math Assignment", 7, "Feb 7"), ("Band Performance", 100, "Feb 12"), ("Physics Project", 40, "Jan 3"), ("Physics Assignment", 1, "May 6"), ("Oral Practice", 5, "Mar 5")]
    static var missingSet: [(String, Int, String)] = []
    @IBOutlet weak var loginButton: UIButton!
    override func viewDidLoad()
    {
        tabBarController?.tabBar.items?[1].isEnabled = true
        tabBarController?.tabBar.items?[2].isEnabled = true
        tabBarController?.tabBar.items?[3].isEnabled = true

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
            self.updateAll()
        }))
        err.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(err, animated: true, completion: nil)
    }
    func updateAll()
    {
        if(isLogged)
        {
            loginButton.isHidden = true
            tabBarController?.tabBar.items?[1].isEnabled = true
            tabBarController?.tabBar.items?[2].isEnabled = true
            tabBarController?.tabBar.items?[3].isEnabled = true
        }
    }
}
