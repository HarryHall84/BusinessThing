import UIKit
///Harrison smells of foul brussle sprouts, and his mother is a hampster!
class UpcomingAssignments: UIViewController, UITableViewDelegate, UITableViewDataSource{
     /*
     String, Int, String
     .0: Assignment Name
     .1: Points Val.
     .2: Due Date
     */
    var basicSet = [("English Assignment", 0, "Mar 5"), ("AP Gov Project", 60, "Apr 2"), ("Math Assignment", 7, "Feb 7"), ("Band Performance", 100, "Feb 12"), ("Physics Project", 40, "Jan 3"), (("Physics Assignment", 1, "May 6"))]
    var overdue: [(String, Int, String)] = []
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
        let weighted = UIAction(title: "Weighted", handler: { _ in
            self.sorter(juxtid: 0)
            self.tableViewOutlet.reloadData()
        })
        let menu = UIMenu(title: "Organize based on...", children: [date, points, weighted])
        sortBtn.menu = menu
        tableViewOutlet.dataSource = self
        tableViewOutlet.delegate = self
        sortBtn.showsMenuAsPrimaryAction = true
        sorter(juxtid: 2)
        var d = (Date.now.description.split(separator: " "))[0].split(separator: "-")
        d.remove(at: 0)
        for x in 0...basicSet.count - 1
        {
            print(x)
            let y = datea(input: basicSet[x].2)
            if Int(d[0])! < y.0 && Int(d[1])! < y.1
            {
                break
            }
        }
        super.viewDidLoad()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return basicSet.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewOutlet.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomCell
        cell.dueOutlet.text = "Due \(basicSet[indexPath.row].2)"
        cell.nameOutlet.text = "\(basicSet[indexPath.row].0)"
        cell.pointsOutlet.text =  "\(basicSet[indexPath.row].1)"
        return cell
    }
    func sorter(juxtid: Int)
    {
        var high: (Int, Int)
        /*
        Int, Int
        .0: Month / Point Val.
        .1: Day
        */
        switch juxtid
        {
        case 0:
            // Weighted
            /*
             This one is a fiesty one indeed; In short, this sorts assignments by relative weight. Both their
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
            for x in 0...basicSet.count - 2
            {
                high.0 = x
                for y in x + 1 ..< basicSet.count
                {
                    if basicSet[y].1 > basicSet[high.0].1
                    {
                        high.0 = y
                    }
                }
                if x != high.0
                {
                    let temp = basicSet[high.0]
                    basicSet[high.0] = basicSet[x]
                    basicSet[x] = temp
                }
            }
        case 2:
            // Date
            // broöooooooohgyazesxdghcgfhvuioujhvghcufxgdy
            // me too ✊😔
            var count = 0
            var totalSort = 0
            var prevMonthDatea = (0, 0)
            while totalSort != basicSet.count
            {
                totalSort = 0
                count = 0
                for x in basicSet
                {
                    let monthDatea = datea(input: x.2)
                    if monthDatea.0 < prevMonthDatea.0 && count > 0
                    {
                        let temp = basicSet[count]
                        basicSet[count] = basicSet[count - 1]
                        basicSet[count - 1] = temp
                        totalSort -= 1
                    }
                    else if monthDatea.0 == prevMonthDatea.0 && count > 0
                    {
                        if monthDatea.1 < prevMonthDatea.1
                        {
                            let temp = basicSet[count]
                            basicSet[count] = basicSet[count - 1]
                            basicSet[count - 1] = temp
                            totalSort -= 1
                        }
                    }
                    count += 1
                    totalSort += 1
                    prevMonthDatea = monthDatea
                }
            }
        default:
            break;
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
