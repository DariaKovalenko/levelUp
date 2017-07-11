//
//  TeachersViewController.swift
//  Generics
//
//  Created by Daria on 7/10/17.
//  Copyright © 2017 Daria. All rights reserved.
//

import UIKit

class TeachersViewController: UIViewController {
    
    let dataSource = PersonsDataSource<Teacher, TeacherTableViewCell>()

//    var teachers: [Teacher] = []
//    var filteredTeachers = [Teacher]()
    

//    func filter(with searchString: String) {
//        filteredPersons = Generics.filter(array: persons, searchString: searchString)
//        filteredTeachers = Generics.filter(array: teachers, searchString: searchString)
//        filteredTeachers = teachers.filtered(with: searchString)
//    }
    
//    func teachersFiltered(with searchString: String) -> [Teacher] {
//        return teachers.filter { (teacher) in
//            return teacher.fullName.hasPrefix(searchString)
//        }
//    }

}

//extension TeachersViewController: UITableViewDataSource {
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return filteredTeachers.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
////        let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(TeacherTableViewCell.self)) as? TeacherTableViewCell
////        cell?.fill(with: teachers[indexPath.row])
////        
////        return cell ?? UITableViewCell()
//        
//        let cell: TeacherTableViewCell = tableView.dequeueCell()
//        cell.fill(with: filteredTeachers[indexPath.row])
//        
//        return cell
//    }
//}
