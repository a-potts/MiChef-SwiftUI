//
//  RecipeViewModel.swift
//  MiChef
//
//  Created by Austin Potts on 8/8/23.
//

import Foundation
import FirebaseFirestore



//Observable Object is part of the Combine framework which allows any object to become a publsiher, it notifes the view (subscriber) of the changes to update the UI
class RecipeViewModel: ObservableObject {
    
    //announces to subscribers when values change
    @Published private(set) var recipes: [Recipe] = []
    //private set only allow this class to update the values
    
   
    
    init() {
        getRecipes()
    }
    
    func addRecipe(recipe: Recipe) {
        recipes.append(recipe)
    }
    
    
    //MARK: Fetch firestore values
    func getRecipes(){
        
        let db = Firestore.firestore()
        
        let docRef = db.collection("Recipes")
        
        docRef.getDocuments { snapshot, error in
            guard error == nil else {
                print (error!.localizedDescription)
                return
                
            }
            
            if let snapshot = snapshot {
                //Iterate through the snapshot values & append each value to the property array
                for document in snapshot.documents {
                    let data = document.data()
                    
                    let name = data["name"] as? String ?? ""
                    let image = data["image"] as? String ?? ""
                    let description = data["description"] as? String ?? ""
                    let ingredients = data["ingredients"] as? String ?? ""
                    let directions = data["directions"] as? String ?? ""
                    let category = data["category"] as? String ?? ""
                    let datePublish = data["datePublish"] as? String ?? ""
                    let url = data["url"] as? String ?? ""



                    let recipe = Recipe(name: name, image: image, description: description, ingredients: ingredients, directions: directions, category: category, datePublish: datePublish, url: url)
                    self.recipes.append(recipe)
                    
                }
            }
            
        }
    }
    
    
}



