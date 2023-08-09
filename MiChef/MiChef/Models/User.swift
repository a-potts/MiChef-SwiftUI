//
//  Person.swift
//  MiChef
//
//  Created by Austin Potts on 8/9/23.
//

import Foundation


class User: ObservableObject {
    var email: String
    var name: String
    
    init(email: String, name: String) {
        self.email = email
        self.name = name
    }
    
}
