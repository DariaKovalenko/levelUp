//
//  StudentsViewController.swift
//  Generics
//
//  Created by Daria on 7/10/17.
//  Copyright © 2017 Daria. All rights reserved.
//

import UIKit

class StudentsViewController: UIViewController {

    let dataSource = PersonsDataSource<Student, StudentTableViewCell>()
    
    @IBOutlet var tableView: UITableView?
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView?.dataSource = dataSource
        dataSource.filteredPersons = [Student.init(firstName: "slsls", lastName: "kdkdkd", group: "groudkjfslk"),
        Student.init(firstName: "slsls", lastName: "kdkdkd", group: "groudkjfslk")]
    }
    
//    func filter(with searchString: String) {
//        filteredStrudents = Generics.filter(array: students, searchString: searchString)
//    }

}

//extension StudentsViewController: UITableViewDataSource {
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return filteredStrudents.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell: StudentTableViewCell = tableView.dequeueCell()
//        cell.fill(with: filteredStrudents[indexPath.row])
//        
//        return cell
//    }
//
//}
