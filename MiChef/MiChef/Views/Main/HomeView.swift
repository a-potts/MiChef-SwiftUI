//
//  HomeView.swift
//  MiChef
//
//  Created by Austin Potts on 8/8/23.
//

import SwiftUI

struct HomeView: View {
    // Environment Object suggests that the observable object was supplied by the parent view
    @EnvironmentObject var recipesVM: RecipeViewModel
    
    var body: some View {
        NavigationView {
            
            // Use List to iterate through an array, displaying each item in a list
//            List(Recipe.all) { recipe in
//                Text(recipe.name)
//                    .navigationTitle("My Recipes")
//            }
            
            ScrollView {
                //MARK: View Model handling the data
                RecipeList(recipes: recipesVM.recipes)
            }
            .navigationTitle("My Recipes")
        }
        .navigationViewStyle(.stack)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(RecipeViewModel())
            
    }
}
