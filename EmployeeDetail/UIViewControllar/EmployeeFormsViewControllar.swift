//
//  EmployeeFormsViewControllar.swift
//  EmployeeDetail
//
//  Created by Payal Wankhede on 20/04/18.
//  Copyright © 2018 Payal Wankhede. All rights reserved.
//

import UIKit

class EmployeeFormsViewControllar: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        numberTextField.delegate = self
        nameTextField.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        numberTextField.isUserInteractionEnabled = true
        nameTextField.isUserInteractionEnabled = true
        self.title = "Employee Form"
        
    }
    //MARK: - Button Action
    @IBAction func submitButtonAction(_ sender: Any) {
        if(nameTextField.text == ""){
            notifyUser("Employee Detail", message: "Please enter name")

        }
        else if(!validate(value: numberTextField.text!)){
            notifyUser("Employee Detail", message: "Please enter valid phone number")
        }
        else{
            let employeeobj = EmployeeModel(employeeName: nameTextField.text!, employeePhoneNumber: numberTextField.text!, isEmployeeFav: false)
            EmployeeControllar.sharedInstance.convertAndSaveInDDPath(array: [employeeobj])
            self.navigationController?.popViewController(animated: true)
        }
    }
    //MARK: - Show Alert Controllar
    func notifyUser(_ title: String, message: String) -> Void
    {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: UIAlertControllerStyle.alert)
        
        let cancelAction = UIAlertAction(title: "OK",
                                         style: .cancel, handler: nil)
        
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
    //MARK: - VAlidate phone number
    func validate(value: String) -> Bool {
        let PHONE_REGEX = "^((\\+)|(00))[0-9]{6,14}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result =  phoneTest.evaluate(with: value)
        return result
    }
   
}
