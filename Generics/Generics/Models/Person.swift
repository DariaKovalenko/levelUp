//
//  Person.swift
//  Generics
//
//  Created by Daria on 7/10/17.
//  Copyright © 2017 Daria. All rights reserved.
//

import UIKit

class Person {

    var firstName: String = ""
    var lastName: String = ""
    
    var fullName: String {
        return firstName + " " + lastName
    }
}

func filter<T: Person>(array: [T], searchString: String) -> [T] {
    return array.filter { (person) in
        return person.fullName.hasPrefix(searchString)
    }
}
