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
        let cell = tableViewOutlet.dequeueReusableCell(withIdentifier: "customCellMissing", for: indexPath) as! TableViewCell
        cell.assignmentNameOutlet.text = "\(ViewController.missingSet[indexPath.row].0)"
        cell.numPointsOutlet.text = "\(ViewController.missingSet[indexPath.row].1)"
        return cell
    }
    func selectDates(input:Int) -> Int
    {
        var mVar = 0
        switch input
        {
        case 0:
            mVar = 31
        case 1:
            mVar = 27
        case 2:
            mVar = 31
        case 3:
            mVar = 30
        case 4:
            mVar = 31
        case 5:
            mVar = 30
        case 6:
            mVar = 31
        case 7:
            mVar = 31
        case 8:
            mVar = 30
        case 9:
            mVar = 31
        case 10:
            mVar = 30
        case 11:
            mVar = 31
        default:
            mVar = 0
        }
        return mVar
    }
    func datea(input: String) -> (Int, Int)
    {
        let x = input.split(separator: " ")
         /*
         Int, Int
         .0: Month
         .1: Day
         */
        var y: (Int, Int)
        switch x[0].lowercased()
        {
        case "jan":
            y.0 = 0
        case "feb":
            y.0 = 1
        case "mar":
            y.0 = 2
        case "apr":
            y.0 = 3
        case "may":
            y.0 = 4
        case "jun":
            y.0 = 5
        case "jul":
            y.0 = 6
        case "aug":
            y.0 = 7
        case "sep":
            y.0 = 8
        case "oct":
            y.0 = 9
        case "nov":
            y.0 = 10
        case "dec":
            y.0 = 11
        default:
            y.0 = -1
        }
        y.1 = Int(x[1])!
        return y;
    }
}
