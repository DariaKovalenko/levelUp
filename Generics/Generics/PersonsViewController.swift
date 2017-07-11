//
//  ViewController.swift
//  Generics
//
//  Created by Daria on 7/10/17.
//  Copyright © 2017 Daria. All rights reserved.
//

import UIKit

class PersonTableCell<T: Person>: UITableViewCell {
    func fill(with person: T) {}
}

class PersonsDataSource<T: Person, Cell: PersonTableCell<T>>: NSObject, UITableViewDataSource, UITableViewDelegate {
    var persons: [T] = []
    var filteredPersons = [T]()
    
    var selectionHandler: ((T) -> Void)?
    
    func filter(with searchString: String) {
        filteredPersons = Generics.filter(array: persons, searchString: searchString)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredPersons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: Cell = tableView.dequeueCell()
        cell.fill(with: filteredPersons[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectionHandler?(filteredPersons[indexPath.row])
    }
}

extension UITableView {
    
    func dequeueCell<T: UITableViewCell>() -> T {
        guard let identifier = NSStringFromClass(T.self).components(separatedBy: ".").last,
            let cell = self.dequeueReusableCell(withIdentifier: identifier) as? T else {
                fatalError("TableView failed to dequeue cell")
        }
        
        return cell
    }
    
}

