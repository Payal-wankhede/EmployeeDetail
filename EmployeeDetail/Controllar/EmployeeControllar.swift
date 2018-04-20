//
//  EmployeeControllar.swift
//  EmployeeDetail
//
//  Created by Payal Wankhede on 20/04/18.
//  Copyright © 2018 Payal Wankhede. All rights reserved.
//

import UIKit

class EmployeeControllar: NSObject {
    var employeeModel:[EmployeeModel] = []
    static let sharedInstance: EmployeeControllar = {
        let instance = EmployeeControllar()
        
        // setup code
        
        return instance
    }()
    
    //MARK: - Store Employee Detail In Plist

    func convertAndSaveInDDPath (array:[EmployeeModel]) {
        var objCArray = NSMutableArray()
        var employeeArray = fetchEmployeeDataFromPlist()
        objCArray = employeeArray.mutableCopy() as! NSMutableArray
        for obj in array {
            
            // we have to do something like this as we can't store struct objects directly in NSMutableArray
            let dict = NSDictionary(objects: [obj.employeeName ,obj.employeePhoneNumber ,obj.isEmployeeFav ], forKeys: [EmployeeConstant.plistConstant.employeeName as NSCopying,EmployeeConstant.plistConstant.employeeNumber as NSCopying,EmployeeConstant.plistConstant.employeeIsFavFlag as NSCopying])
            objCArray.add(dict)
        }
        employeeArray = objCArray
        // this line will save the array in document directory path.
        employeeArray.write(toFile: getFilePath(fileName: EmployeeConstant.plistName), atomically: true)
    }
    
    
    //MARK: - Fetch Plist Data
    func fetchEmployeeDataFromPlist() -> NSArray {
         let employeeArray = NSArray(contentsOfFile: EmployeeControllar.sharedInstance.getFilePath(fileName: EmployeeConstant.plistName))
        return employeeArray!
        
    }
    
    //MARK: - GET plistfile Path
    func getFilePath(fileName:String) -> String {
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        let url = NSURL(fileURLWithPath: path)
        let filePath = url.appendingPathComponent(fileName)?.path
        return filePath!
    }
    
    //MARK: - Convert plist data in Modale
    func convertObjectInEmployeeModel(employeeArray:NSArray) {
        
        employeeModel = []
        for obj in employeeArray {
            let employeeModelObj = EmployeeModel(employeeName: "\((obj as! NSDictionary).value(forKey:EmployeeConstant.plistConstant.employeeName)!)", employeePhoneNumber: "\((obj as! NSDictionary).value(forKey:EmployeeConstant.plistConstant.employeeNumber)!)", isEmployeeFav: (obj as! NSDictionary).value(forKey:EmployeeConstant.plistConstant.employeeIsFavFlag) as! Bool)
            employeeModel.append(employeeModelObj)
            
        }
        
    }
    
 
    //MARK: - Fetch employee model
    func fetchAndStoreEmployeeDataInModel
        () -> [EmployeeModel] {
        
        let employeeArray = fetchEmployeeDataFromPlist()
        convertObjectInEmployeeModel(employeeArray: employeeArray)
        
        return employeeModel
    }
}
