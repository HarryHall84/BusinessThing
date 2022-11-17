import UIKit
class UpcomingAssignments: UIViewController, UITableViewDelegate, UITableViewDataSource{
    var basicSet = [("English Assignment", 0, "Oct 5"), ("Math Assignment", 7, "Oct 7"), ("Performance", 100, "Dec 12")]
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    override func viewDidLoad() {
        tableViewOutlet.dataSource = self
        tableViewOutlet.delegate = self
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
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
