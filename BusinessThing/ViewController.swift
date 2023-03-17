/// Created by Harrison Hall & Carl Show on 11/14/22.
import UIKit
class ViewController: UIViewController
{
    var isLogged = false
    /*
    String, Int, Bool, String, String
    .0: Assignment Name
    .1: Points Val.
    .2: Points Type
    .3: Due Date
    .4: [OPTIONAL] Time Alloted
    */
    static var basicSet = [("English Assignment", 0, false, "Mar 5", ""), ("AP Gov Project", 60, true, "Apr 2", ""), ("Math Assignment", 7, false, "Jun 7", ""), ("Band Performance", 100, true, "May 12", "2 Hours"), ("Physics Project", 40, true, "Jan 3", ""), ("Physics Assignment", 1, false, "May 6", ""), ("Oral Practice", 5, false, "Mar 5", "")]
    /*
    String, Int, String
    .0: Assignment Name
    .1: Points Val.
    .2: Due Date
    .3: [OPTIONAL] Time Alloted
    */
    static var missingSet = [("English Reflection", 20, false, "Feb 27", "")]
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var welcomeMessage: UILabel!
    override func viewDidLoad()
    {
        welcomeMessage.isHidden = true
        tabBarController?.tabBar.items?[1].isEnabled = false
        tabBarController?.tabBar.items?[2].isEnabled = false
        tabBarController?.tabBar.items?[3].isEnabled = false

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
            } else {
                let loginFail = UIAlertController(title: "Your username or password is incorrect. Please try again", message: "", preferredStyle: .alert)
                loginFail.addAction(UIAlertAction(title: "OK", style: .default))
                self.present(loginFail, animated: true, completion: nil)
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
            welcomeMessage.isHidden = false
            tabBarController?.tabBar.items?[1].isEnabled = true
            tabBarController?.tabBar.items?[2].isEnabled = true
            tabBarController?.tabBar.items?[3].isEnabled = true
            self.tabBarController?.selectedIndex = 1
            
            
        }
    }
}
