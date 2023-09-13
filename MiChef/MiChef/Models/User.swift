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
    var recipes: [Recipe]
    
    init(email: String, name: String, recipes: [Recipe]) {
        self.email = email
        self.name = name
        self.recipes = recipes
    }
    
}
