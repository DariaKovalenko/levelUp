//
//  Teacher.swift
//  Generics
//
//  Created by Daria on 7/10/17.
//  Copyright © 2017 Daria. All rights reserved.
//

import UIKit

class Teacher: Person {

    var students: [Student] = []
    
    init(firstName: String, lastName: String, students: [Student]) {
        super.init()
        self.firstName = firstName
        self.lastName = lastName
        self.students = students
    }
    
}
