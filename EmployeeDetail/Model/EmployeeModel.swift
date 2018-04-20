//
//  EmployeeModel.swift
//  EmployeeDetail
//
//  Created by Payal Wankhede on 20/04/18.
//  Copyright © 2018 Payal Wankhede. All rights reserved.
//

import UIKit

class EmployeeModel: NSObject {

    var employeeName:String = ""
    var employeePhoneNumber:String = ""
    var isEmployeeFav:Bool = false
    
    init(employeeName: String, employeePhoneNumber: String, isEmployeeFav: Bool){
        self.employeeName = employeeName
        self.employeePhoneNumber = employeePhoneNumber
        self.isEmployeeFav = isEmployeeFav
        
        
    }
   
    
}
