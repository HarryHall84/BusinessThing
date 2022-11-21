//
//  TableViewCell.swift
//  BusinessThing
//
//  Created by HARRISON HALL on 11/17/22.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var assignmentNameOutlet: UILabel!
    
    @IBOutlet weak var numPointsOutlet: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
