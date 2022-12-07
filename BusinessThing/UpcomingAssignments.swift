import UIKit

class UpcomingAssignments: UIViewController, UITableViewDelegate, UITableViewDataSource{
    var basicSet = [("English Assignment", 0, "Oct 5"), ("Math Assignment", 7, "Oct 7"), ("Performance", 100, "Dec 12"), ("A1", 20, "Jan 3")]
    var priPts = false
    var priDate = true
    
    @IBOutlet weak var tableViewOutlet: UITableView!
    @IBOutlet weak var sortBtn: UIButton!
    override func viewDidLoad() {
        let date = UIAction(title: "Date", handler: { _ in
            self.priDate = true
            self.priPts = false
            print(self.priDate)
            print(self.priPts)
        } )
        let points = UIAction(title: "Points", handler: { _ in
            self.priPts = true
            self.priDate = false
            print(self.priDate)
            print(self.priPts)
//            self.basicSet.sort(by: >)
//            print(self.basicSet)
//            self.tableViewOutlet.reloadData()
            self.sorter(juxtid: 1)
            print(self.basicSet)

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
//        for i in input
//        {
            switch juxtid
            {
            case 0:
                return
             // var assignment = i.0
            case 1:
              // var pts = i.1
                for x in 0...basicSet.count - 1{
                   // var temp = try?basicSet[x+1].1
                    if basicSet[x].1 < basicSet[x + 1].1 {
                        var temp = basicSet[x + 1]
                        basicSet[x + 1] = basicSet[x]
                        basicSet[x] = temp
                    }
                }
            case 2:
                return
             // var date = i.2
              
            default:
                break;
            }
      //  }
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


