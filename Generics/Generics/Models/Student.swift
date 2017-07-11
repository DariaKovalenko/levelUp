//
//  Student.swift
//  Generics
//
//  Created by Daria on 7/10/17.
//  Copyright © 2017 Daria. All rights reserved.
//

import UIKit

class Student: Person {

    var group: String = ""
    
    init(firstName: String, lastName: String, group: String) {
        super.init()
        self.firstName = firstName
        self.lastName = lastName
        self.group = group
    }
    
}
