//
//  StudentTableViewCell.swift
//  Generics
//
//  Created by Daria on 7/10/17.
//  Copyright © 2017 Daria. All rights reserved.
//

import UIKit

class StudentTableViewCell: PersonTableCell<Student> {
    
    @IBOutlet var studentNameLabel: UILabel?
    @IBOutlet var groupLabel: UILabel?
    
    override func fill(with student: Student) {
        studentNameLabel?.text = student.fullName
        groupLabel?.text = student.group
    }

}
