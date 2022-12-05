import UIKit
class UpcomingAssignments: UIViewController, UITableViewDelegate, UITableViewDataSource{
    var basicSet = [("English Assignment", 0, "Oct 5"), ("Math Assignment", 7, "Oct 7"), ("Performance", 100, "Dec 12")]
    @IBOutlet weak var tableViewOutlet: UITableView!
    @IBOutlet weak var sortBtn: UIButton!
    override func viewDidLoad() {
        pullDownBtn((Any).self)
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
    
    
    @IBAction func pullDownBtn(_ sender: Any) {
        // wtf do we do here dog
        let date = UIAction(title: "Date", handler: { _ in print("Sewi")} )
        let points = UIAction(title: "Points", handler: { _ in print("YOOO")})
        let menu = UIMenu(title: "Prioritize", children: [date, points])
        sortBtn.menu = menu
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
