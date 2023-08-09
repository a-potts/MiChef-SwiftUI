//
//  RecipeViewModel.swift
//  MiChef
//
//  Created by Austin Potts on 8/8/23.
//

import Foundation

//Observable Object is part of the Combine framework which allows any object to become a publsiher, it notifes the view (subscriber) of the changes to update the UI
class RecipeViewModel: ObservableObject {
    
    //announces to subscribers when values change
    @Published private(set) var recipes: [Recipe] = []
    //private set only allow this class to update the values
    
    init() {
        recipes = Recipe.all
    }
    
}
