import UIKit

class UpcomingAssignments: UIViewController, UITableViewDelegate, UITableViewDataSource{
    /*
     String, Int, String
     .0: Assignment Name
     .1: Points Val.
     .2: Due Date
     */
    var basicSet = [("English Assignment", 0, "Oct 5"), ("AP Gov Project", 60, "Oct 2"), ("Math Assignment", 7, "Oct 7"), ("Band Performance", 100, "Dec 12"), ("Physics Project", 40, "Jan 3"), (("History Assignment", 1, "Dec 6"))]
    var priPts = false
    var priDate = true
    var dayte = Date()
    
    @IBOutlet weak var tableViewOutlet: UITableView!
    @IBOutlet weak var sortBtn: UIButton!
    override func viewDidLoad() {
        let date = UIAction(title: "Date", handler: { _ in
            self.priDate = true
            self.priPts = false
            self.sorter(juxtid: 2)
            self.tableViewOutlet.reloadData()
           // print(self.basicSet)
        } )
        let points = UIAction(title: "Points", handler: { _ in
            self.priPts = true
            self.priDate = false
            self.sorter(juxtid: 1)
            print(self.basicSet)
            self.tableViewOutlet.reloadData()
        })
        let menu = UIMenu(title: "Prioritize", children: [date, points])
        sortBtn.menu = menu
        tableViewOutlet.dataSource = self
        tableViewOutlet.delegate = self
        sortBtn.showsMenuAsPrimaryAction = true
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
        /*
         Int, Int
         .0: Month / Point Val.
         .1: Day
         */
        var high: (Int, Int)
        switch juxtid
        {
        case 0:
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
            var count = 0
            high.0 = 0
            high.1 = 0
            var prevMothDatea = (0, 0)
            
            
            for x in basicSet
            {

                let monthDatea = datea(input: x.2)
               // print(monthDatea)
               // print(prevMothDatea)
                if monthDatea.0 < prevMothDatea.0
                {
                    let temp = basicSet[count - 1]
                    print(prevMothDatea)
                    basicSet[count - 1] = basicSet[count]
                    basicSet[count] = temp
                    print(basicSet)
                }
                else if monthDatea.0 == prevMothDatea.0
                {
                    if monthDatea.1 < prevMothDatea.1
                    {
                        let temp = basicSet[count - 1]
                        basicSet[count - 1] = basicSet[count]
                       // print(basicSet)
                        basicSet[count] = temp
                        print(basicSet)
                    }
                }
                count += 1
                prevMothDatea = monthDatea
               // print(basicSet)
            }
            print(basicSet)
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
      //  print(y)
        return y;
    }
}
        
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


