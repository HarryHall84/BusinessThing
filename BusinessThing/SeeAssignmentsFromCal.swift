//
//  SeeAssignmentsFromCal.swift
//  BusinessThing
//
//  Created by CARL SHOW on 1/18/23.
//

import UIKit

class CalendarSeeAssignmentCustomCell: UITableViewCell {
    
    
    
}


class SeeAssignmentsFromCal: UIViewController, UITableViewDelegate, UITableViewDataSource {

 
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewOutlet.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CalendarSeeAssignmentCustomCell
        return cell
    }
    
}
