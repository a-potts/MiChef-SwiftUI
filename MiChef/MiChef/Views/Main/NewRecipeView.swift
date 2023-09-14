//
//  NewRecipeView.swift
//  MiChef
//
//  Created by Austin Potts on 8/8/23.
//

import SwiftUI

struct NewRecipeView: View {
    @State private var showAddRecipe = false
    
    var body: some View {
        NavigationView {
            Button("Add Recipe Manually") {
                showAddRecipe = true
            }
                .navigationTitle("New Recipe")
        }
        .navigationViewStyle(.stack)
        .fullScreenCover(isPresented: $showAddRecipe, content: {
            AddRecipeView()
        })
    }
}

struct NewRecipeView_Previews: PreviewProvider {
    //This is a trick to force data to the preview model
    //Need to add this since we declared a insatce of the property above, it will have no value when the process reaches it so we must set one
    //Declare a lazy static constant
    static let recipesVM: RecipeViewModel = {
     let recipesVM = RecipeViewModel()
     recipesVM.recipes = recipeListPreviewData
     return recipesVM
    }()
    
    static var previews: some View {
        NewRecipeView()
            .environmentObject(recipesVM)
    }
}
