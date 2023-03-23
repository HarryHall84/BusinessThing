import UIKit
class UpcomingAssignments: UIViewController, UITableViewDelegate, UITableViewDataSource{
    @IBOutlet weak var tableViewOutlet: UITableView!
    @IBOutlet weak var sortBtn: UIButton!
    override func viewDidLoad() {
        let date = UIAction(title: "Date", handler: { _ in
            self.sorter(juxtid: 2)
            self.tableViewOutlet.reloadData()
        })
        let points = UIAction(title: "Points", handler: { _ in
            self.sorter(juxtid: 1)
            self.tableViewOutlet.reloadData()
        })
        let time = UIAction(title: "Time", handler: { _ in
            self.sorter(juxtid: 3)
            self.tableViewOutlet.reloadData()
        })
        let weighted = UIAction(title: "Weighted", handler: { _ in
            self.sorter(juxtid: 0)
            self.tableViewOutlet.reloadData()
        })
        let menu = UIMenu(title: "Organize based on...", children: [date, points, time, weighted])
        sortBtn.menu = menu
        tableViewOutlet.dataSource = self
        tableViewOutlet.delegate = self
        sortBtn.showsMenuAsPrimaryAction = true
        sorter(juxtid: 2)
        print(ViewController.basicSet)
        var d = (Date.now.description.split(separator: " "))[0].split(separator: "-")
        d.remove(at: 0)
        var inp = datea(input: ViewController.basicSet[0].due)
        while(inp.0 < Int(d[0])! && inp.1 < Int(d[1])!)
        {
            ViewController.missingSet.append(ViewController.basicSet[0])
            ViewController.basicSet.remove(at: 0)
            if ViewController.basicSet.isEmpty
            {
                break
            }
            else
            {
                inp = datea(input: ViewController.basicSet[0].due)
            }
        }
        super.viewDidLoad()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ViewController.basicSet.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewOutlet.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomCell
        cell.dueOutlet.text = "Due \(ViewController.basicSet[indexPath.row].due)"
        cell.nameOutlet.text = "\(ViewController.basicSet[indexPath.row].name)"
        cell.pointsOutlet.text =  "\(ViewController.basicSet[indexPath.row].points)"
        if ViewController.basicSet[indexPath.row].pType
        {
            cell.pointsOutlet.text! += " Summitive Points"
        }
        else
        {
            cell.pointsOutlet.text! += " Formitive Points"
        }
        cell.timeOutlet.text = "\(ViewController.basicSet[indexPath.row].time)"
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete
        {
            ViewController.basicSet.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    func sorter(juxtid: Int)
    {
        /*
        Int, Int
        .0: Month / Point Val / Time.
        .1: Day
        */
        var high: (Int, Int)
        switch juxtid
        {
        case 0:
            // Weighted
            /*
             This one here is a fiesty one indeed; In short, this sorts assignments by relative weight. Both their
             point values and due date are factored together, assigning a made up "weight" of each assignment.
             I think this could be a good way to get students to focus on upcoming assignments after finishing
             any due assignments
             */
//            var count = 0
//            var totalSort = 0
//            var prevMonthDatea = (0, 0)
//            while totalSort != basicSet.count
//            {
//                totalSort = 0
//                count = 0
//                for x in basicSet
//                {
//                    let monthDatea = datea(input: x.2)
//                    if monthDatea.0 < prevMonthDatea.0 && count > 0
//                    {
//                        let temp = basicSet[count]
//                        basicSet[count] = basicSet[count - 1]
//                        basicSet[count - 1] = temp
//                        totalSort -= 1
//                    }
//                    else if monthDatea.0 == prevMonthDatea.0 && count > 0
//                    {
//                        if monthDatea.1 < prevMonthDatea.1
//                        {
//                            let temp = basicSet[count]
//                            basicSet[count] = basicSet[count - 1]
//                            basicSet[count - 1] = temp
//                            totalSort -= 1
//                        }
//                    }
//                    count += 1
//                    totalSort += 1
//                    prevMonthDatea = monthDatea
//                }
//            }
            // until I finish it, however, it will remain a date sorter.
            return
        case 1:
            // Points
            if ViewController.basicSet.count > 2
            {
                for x in 0...ViewController.basicSet.count - 2
                {
                    high.0 = x
                    for y in x + 1 ..< ViewController.basicSet.count
                    {
                        if ViewController.basicSet[y].points > ViewController.basicSet[high.0].points
                        {
                            high.0 = y
                        }
                    }
                    if x != high.0
                    {
                        let temp = ViewController.basicSet[high.0]
                        ViewController.basicSet[high.0] = ViewController.basicSet[x]
                        ViewController.basicSet[x] = temp
                    }
                }
            }
        case 2:
            // Date
            // broöooooooohgyazesxdghcgfhvuioujhvghcufxgdy
            // me too ✊😔
            var count = 0
            var totalSort = 0
            var prevMonthDatea = (0, 0)
            while totalSort != ViewController.basicSet.count
            {
                totalSort = 0
                count = 0
                for x in ViewController.basicSet
                {
                    let monthDatea = datea(input: x.due)
                    if monthDatea.0 < prevMonthDatea.0 && count > 0
                    {
                        let temp = ViewController.basicSet[count]
                        ViewController.basicSet[count] = ViewController.basicSet[count - 1]
                        ViewController.basicSet[count - 1] = temp
                        totalSort -= 1
                    }
                    else if monthDatea.0 == prevMonthDatea.0 && count > 0
                    {
                        if monthDatea.1 < prevMonthDatea.1
                        {
                            let temp = ViewController.basicSet[count]
                            ViewController.basicSet[count] = ViewController.basicSet[count - 1]
                            ViewController.basicSet[count - 1] = temp
                            totalSort -= 1
                        }
                    }
                    count += 1
                    totalSort += 1
                    prevMonthDatea = monthDatea
                }
            }
        case 3:
            // is this for time? Im not touching this if it isn't, but it looks good so far
            break
        default:
            break
        }
        
    }
    @IBAction func addAssignment(_ sender: Any)
    {
        let new = Assignent()
        let err = UIAlertController(title: "Add a New Assignment", message: "Provide the following information:", preferredStyle: .alert)
        err.addTextField{(textField) in
            textField.placeholder = "Name"}
        err.addTextField{(textField) in
            textField.placeholder = "Date"}
        err.addTextField{(textField) in
            textField.placeholder = "Points"}
        err.addTextField{(textField) in
            textField.placeholder = "Time [Optional]"}
        err.addAction(UIAlertAction(title: "Post as Formative", style: .default, handler: { alert -> Void in
            if Int(err.textFields![2].text!) == nil
            {
                self.didFail(type: 1)
            }
            else if datea(input: err.textFields![1].text!).0 == -1
            {
                self.didFail(type: 2)
            }
            else if datea(input: err.textFields![1].text!).1 == -1
            {
                self.didFail(type: 3)
            }
            else
            {
                new.name = err.textFields![0].text ?? "Unknown Assignment"
                new.due = err.textFields![1].text ?? "Unassigned"
                new.points = Int(err.textFields![2].text!) ?? -1
                new.time = err.textFields![3].text ?? ""
                new.pType = false
                ViewController.basicSet.append(new)
                self.tableViewOutlet.reloadData()
            }
        }))
        err.addAction(UIAlertAction(title: "Post as Summitive", style: .default, handler: { alert -> Void in
            if Int(err.textFields![2].text!) == nil
            {
                self.didFail(type: 1)
            }
            else if datea(input: err.textFields![1].text!).0 == -1
            {
                self.didFail(type: 2)
            }
            else if datea(input: err.textFields![1].text!).1 == -1
            {
                self.didFail(type: 3)
            }
            else
            {
                new.name = err.textFields![0].text ?? "Unknown Assignment"
                new.due = err.textFields![1].text ?? "Unassigned"
                new.points = Int(err.textFields![2].text!) ?? -1
                new.time = err.textFields![3].text ?? ""
                new.pType = true
                ViewController.basicSet.append(new)
                self.tableViewOutlet.reloadData()
            }
        }))
        err.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(err, animated: true, completion: nil)
    }
    func didFail(type: Int)
    {
        switch type
        {
        case 1:
            let derr = UIAlertController(title: "Bad Points Value", message: "Make sure your points are formatted as a number.", preferredStyle: .alert)
            derr.addAction(UIAlertAction(title: "Ok", style: .default))
            self.present(derr, animated: true)
        case 2:
            let derr = UIAlertController(title: "Bad Date Format", message: "Limit your month to their first 3 characters.", preferredStyle: .alert)
            derr.addAction(UIAlertAction(title: "Ok", style: .default))
            self.present(derr, animated: true)
        case 3:
            let derr = UIAlertController(title: "Bad Date Format", message: "Make sure your date is formatted as a number.", preferredStyle: .alert)
            derr.addAction(UIAlertAction(title: "Ok", style: .default))
            self.present(derr, animated: true)
        default:
            break
        }
    }
    func dynamicWeights(input: (Int, Int))
    {
        
    }
}
