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
        var inp = datea(input: ViewController.basicSet[0].3)
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
                inp = datea(input: ViewController.basicSet[0].3)
            }
        }
        super.viewDidLoad()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ViewController.basicSet.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewOutlet.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomCell
        cell.dueOutlet.text = "Due \(ViewController.basicSet[indexPath.row].3)"
        cell.nameOutlet.text = "\(ViewController.basicSet[indexPath.row].0)"
        cell.pointsOutlet.text =  "\(ViewController.basicSet[indexPath.row].1)"
        if ViewController.basicSet[indexPath.row].2
        {
            cell.pointsOutlet.text! += " Summitive Points"
        }
        else
        {
            cell.pointsOutlet.text! += " Formitive Points"
        }
        cell.timeOutlet.text = "\(ViewController.basicSet[indexPath.row].4)"
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
                        if ViewController.basicSet[y].1 > ViewController.basicSet[high.0].1
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
                    let monthDatea = datea(input: x.3)
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
            break
        default:
            break
        }
        
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
    func dynamicWeights(input: (Int, Int))
    {
        
    }
}
