//
//  EmployeeDataSource.swift
//  EmployeeDetail
//
//  Created by Payal Wankhede on 20/04/18.
//  Copyright © 2018 Payal Wankhede. All rights reserved.
//


import Foundation

class EmployeeDataSource{
    var employeeModel:[EmployeeModel]

    
    init() {
        employeeModel = []

        let employeeArray = NSArray(contentsOfFile: EmployeeControllar.sharedInstance.getFilePath(fileName: EmployeeConstant.plistName))
        convertObjectInEmployeeModel(employeeArray: employeeArray!)
       
    }
    
    
    func convertObjectInEmployeeModel(employeeArray:NSArray) {
        
        for obj in employeeArray {
            let employeeModelObj = EmployeeModel(employeeName: "\((obj as! NSDictionary).value(forKey:EmployeeConstant.plistConstant.employeeName)!)", employeePhoneNumber: "\((obj as! NSDictionary).value(forKey:EmployeeConstant.plistConstant.employeeNumber)!)", isEmployeeFav: (obj as! NSDictionary).value(forKey:EmployeeConstant.plistConstant.employeeIsFavFlag) as! Bool)
            employeeModel.append(employeeModelObj)
            
        }
        
    }
    
    func getWorkOuts() -> [EmployeeModel]{
        return employeeModel
    }
    
   
    
}
