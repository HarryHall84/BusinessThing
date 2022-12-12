import UIKit

class UpcomingAssignments: UIViewController, UITableViewDelegate, UITableViewDataSource{
    var basicSet = [("English Assignment", 0, "Oct 5"), ("Math Assignment", 7, "Oct 7"), ("Band Performance", 100, "Dec 12"), ("Physics Project", 40, "Jan 3")]
    var priPts = false
    var priDate = true
    
    @IBOutlet weak var tableViewOutlet: UITableView!
    @IBOutlet weak var sortBtn: UIButton!
    override func viewDidLoad() {
        let date = UIAction(title: "Date", handler: { _ in
            self.priDate = true
            self.priPts = false
//            print(self.priDate)
//            print(self.priPts)
            self.sorter(juxtid: 2)
        } )
        let points = UIAction(title: "Points", handler: { _ in
            self.priPts = true
            self.priDate = false
            print(self.priDate)
            print(self.priPts)
//            self.basicSet.sort(by: >)
//            print(self.basicSet)
            self.sorter(juxtid: 1)
            print(self.basicSet)
            self.tableViewOutlet.reloadData()
        })
        let menu = UIMenu(title: "Prioritize", children: [date, points])
        sortBtn.menu = menu
        tableViewOutlet.dataSource = self
        tableViewOutlet.delegate = self
        sortBtn.showsMenuAsPrimaryAction = true
//        datea(input: basicSet[0].2)
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
//        for i in input
//        {
            switch juxtid
            {
            case 0:
                return
             // var assignment = i.0
            case 1:
              // var pts = i.1
                for x in 0...basicSet.count - 2{
                     var high = x
//                    if basicSet[x].1 < basicSet[x + 1].1 {
//                        var temp = basicSet[x + 1]
//                        basicSet[x + 1] = basicSet[x]
//                        basicSet[x] = temp
                    for y in x + 1 ..< basicSet.count {
                        if basicSet[y].1 > basicSet[high].1 {
                            high = y
                        }
                    }
                    if x != high {
                        // swap(&self.basicSet[x], &self.basicSet[low])
                        var temp = basicSet[high]
                        basicSet[high] = basicSet[x]
                        basicSet[x] = temp
                    }
            
                }
            case 2:
                // date
                for x in 0...basicSet.count - 2 {
                    var high = x
                    for y in x + 1 ..< basicSet.count {
                        if datea(input: basicSet[y].2).0 < datea(input: basicSet[high].2).0{
                            high = y
                        }
                         
                    }
                }
                
                return
             // var date = i.2
              
            default:
                break;
            }
      //  }
    }
    func datea(input: String) -> (Int, Int)
    {
        var x = input.split(separator: " ")
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
        
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


