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
    @IBOutlet weak var assignments: UILabel!
    var incoming = [Assignent]()
    var isPast = false
    override func viewDidLoad()
    {
        var d = (Date.now.description.split(separator: " "))[0].split(separator: "-")
        d.remove(at: 0)
        let x = datea(input: incoming[0].due)
        if x.0 < Int(d[0])! && x.1 < Int(d[1])!
        {
            helperText.isHidden = false
            isPast = true
        }
        else
        {
            helperText.isHidden = true
            isPast = false
        }
        tableViewOutlet.dataSource = self
        tableViewOutlet.delegate = self
        if isPast
        {
            tableViewOutlet.backgroundColor = #colorLiteral(red: 0.8577987552, green: 0, blue: 0.2805145085, alpha: 1)
            switch x.0 - Int(d[0])!
            {
            case 0:
                helperText.text = "Past Due: \(Int(d[1])! - x.1) days ago"
            case -1:
                helperText.text = "Past Due: \(Int(d[1])! - x.1) days ago"
            case -2:
                helperText.text = "Past Due: More than a month ago"
            default:
                helperText.text = "Past Due: More than \(Int(d[0])! - x.0) months ago"
            }
        }
        else
        {
            tableViewOutlet.backgroundColor = #colorLiteral(red: 0.7390599251, green: 0.8693705797, blue: 0.9303586483, alpha: 1)
        }
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
        cell.calPointsOutlet.text = String(incoming[row].points)
        if incoming[row].pType
        {
            cell.calPointsOutlet.text! += " Summitive Points"
        }
        else
        {
            cell.calPointsOutlet.text! += " Formative Points"
        }
        cell.calNameOutlet.text = incoming[row].name
        cell.calDueOutlet.text = incoming[row].due
        cell.calTimeOutlet.text = incoming[row].time
        if isPast
        {
            cell.backgroundColor = #colorLiteral(red: 0.971822679, green: 0.5760942101, blue: 0.5608654618, alpha: 0.5)
        }
        else
        {
            cell.backgroundColor = #colorLiteral(red: 0.7977311015, green: 0.9914678931, blue: 0.9258249402, alpha: 0.5)
        }
        return cell
    }
}
