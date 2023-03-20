/// Created by Harrison Hall & Carl Show on 11/14/22.
import UIKit
class ViewController: UIViewController
{
    var isLogged = false
    static var basicSet =
        [
        Assignent(name: "English Assignment", points: 3, pType: false, due: "Mar 5"),
        Assignent(name: "AP Gov Project", points: 60, pType: true, due: "Apr 2"),
        Assignent(name: "Math Assignment", points: 8, pType: false, due: "Jun 7"),
        Assignent(name: "Band Performance", points: 100, pType: true, due: "May 12", time: "2 Hours"),
        Assignent(name: "Physics Quiz", points: 40, pType: true, due: "Jan 3"),
        Assignent(name: "Health Test", points: 75, pType: true, due: "Jan 8")
        ]
    static var missingSet = [Assignent]()
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
