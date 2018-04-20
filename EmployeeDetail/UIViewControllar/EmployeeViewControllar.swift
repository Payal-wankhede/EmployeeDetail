//
//  EmployeeViewControllar.swift
//  EmployeeDetail
//
//  Created by Payal Wankhede on 20/04/18.
//  Copyright © 2018 Payal Wankhede. All rights reserved.
//

import UIKit

class EmployeeViewControllar: UIViewController,UITableViewDelegate,UITableViewDataSource {

   
    var employeeModel:[EmployeeModel] = []
    @IBOutlet weak var employeeSegmentControl: UISegmentedControl!
    @IBOutlet weak var employeeDetailTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        employeeDetailTableView.delegate = self
        employeeDetailTableView.dataSource = self
        registerTableViewNib()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
     //  manager = EmployeeDataSource()
        employeeModel = EmployeeControllar.sharedInstance.fetchAndStoreEmployeeDataInModel()
        employeeDetailTableView.reloadData()
        self.navigationController?.navigationBar.isHidden = true
        employeeSegmentControl.tintColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func registerTableViewNib()  {
        employeeDetailTableView.register(UINib(nibName: "EmployeeTableViewCell", bundle: nil), forCellReuseIdentifier: "EmployeeCell")

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.employeeModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let employeeobj = self.employeeModel[indexPath.row]
        let cell:EmployeeTableViewCell = tableView.dequeueReusableCell(withIdentifier: "EmployeeCell") as! EmployeeTableViewCell
        cell.employeeName.text = employeeobj.employeeName
        cell.employeePhoneNo.text = employeeobj.employeePhoneNumber

        return cell
    }
    
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    
    @IBAction func addemployeeDetailAction(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "EmployeeFormsViewControllar") as! EmployeeFormsViewControllar
        navigationController?.pushViewController(vc,
                                                 animated: true)
    }
    
}



