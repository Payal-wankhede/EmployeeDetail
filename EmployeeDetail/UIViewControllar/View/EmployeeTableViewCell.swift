//
//  EmployeeTableViewCell.swift
//  EmployeeDetail
//
//  Created by Payal Wankhede on 20/04/18.
//  Copyright © 2018 Payal Wankhede. All rights reserved.
//

import UIKit

class EmployeeTableViewCell: UITableViewCell {
    @IBOutlet weak var employeeName: UILabel!
    
    @IBOutlet weak var employeePhoneNo: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
