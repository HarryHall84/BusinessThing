import UIKit

class MissingAssignments: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableViewOutlet: UITableView!
    override func viewDidLoad() {
        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ViewController.missingSet.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewOutlet.dequeueReusableCell(withIdentifier: "customCellMissing", for: indexPath) as! CustomCell
        cell.missNameOutlet.text = "\(ViewController.missingSet[indexPath.row].name)"
        cell.missPointsOutlet.text = "\(ViewController.missingSet[indexPath.row].points)"
        if ViewController.missingSet[indexPath.row].pType
        {
            cell.missPointsOutlet.text! += " Summitive Points"
        }
        else
        {
            cell.missPointsOutlet.text! += " Formative Points"
        }
        cell.missDueOutlet.text = ViewController.missingSet[indexPath.row].due
        cell.missTimeOutlet.text = ViewController.missingSet[indexPath.row].time
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete
        {
            ViewController.missingSet.remove(at: indexPath.row)
            tableViewOutlet.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
