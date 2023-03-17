//
//  SeeAssignmentsFromCal.swift
//  BusinessThing
//
//  Created by CARL SHOW on 1/18/23.
//

import UIKit
class SeeAssignmentsFromCal: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    @IBOutlet weak var tableViewOutlet: UITableView!
    @IBOutlet weak var helperText: UILabel!
    var incoming: [(String, Int, Bool, String, String)] = []
    override func viewDidLoad()
    {
        if incoming.isEmpty
        {
            helperText.isHidden = false
            tableViewOutlet.isHidden = true
        }
        else
        {
            helperText.isHidden = true
            tableViewOutlet.isHidden = false
        }
        tableViewOutlet.dataSource = self
        tableViewOutlet.delegate = self
        super.viewDidLoad()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return incoming.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableViewOutlet.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomCell
        let row = indexPath.row
        cell.calPointsOutlet.text = String(incoming[row].1)
        cell.calNameOutlet.text = incoming[row].0
        return cell
    }
}
