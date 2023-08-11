//
//  RecipeModel.swift
//  MiChef
//
//  Created by Austin Potts on 8/8/23.
//

import Foundation
import FirebaseFirestore

enum Category: String, CaseIterable, Identifiable {
    var id: String  {self.rawValue}
    //This property Id is going to uniquely identify each case of the enum
    case breakfast = "Breakfast"
    case soup = "Soup"
    case salad = "Salad"
    case app = "Appetizer"
    case main = "Main"
    case side = "Side"
    case dessert  = "Dessert"
    case snack = "Snack"
    case drink = "Drink"
}

struct Recipe: Identifiable, Codable {
    let id = UUID()
    let name: String
    let image: String
    let description: String
    let ingredients: String
    let directions: String
    let category: Category.RawValue
    let datePublish: String
    let url: String
    
    var all: [Recipe] = []
    
  

    
    
    
    
}









