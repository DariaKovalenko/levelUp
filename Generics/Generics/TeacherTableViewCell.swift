//
//  TeacherTableViewCell.swift
//  Generics
//
//  Created by Daria on 7/10/17.
//  Copyright © 2017 Daria. All rights reserved.
//

import UIKit

class TeacherTableViewCell: PersonTableCell<Teacher> {
    
    @IBOutlet var nameLabel: UILabel?
    @IBOutlet var studentsCountLabel: UILabel?
    
    override func fill(with teacher: Teacher) {
        nameLabel?.text = teacher.fullName
        studentsCountLabel?.text = String(teacher.students.count)
    }

}
