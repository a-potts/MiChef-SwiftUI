//
//  TabBar.swift
//  MiChef
//
//  Created by Austin Potts on 8/8/23.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            CategoriesView()
                .tabItem {
                    Label("Categories", systemImage: "square.fill.text.grid.1x2")
                }

            
            NewRecipeView()
                .tabItem {
                    Label("New Recipe", systemImage: "plus")
                }

            
            FavoriteView()
                .tabItem {
                    Label("Favorte", systemImage: "star")
                }

            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }

        }
    }
}

struct TabBar_Previews: PreviewProvider {
    //This is a trick to force data to the preview model
    //Need to add this since we declared a insatce of the property above, it will have no value when the process reaches it so we must set one
    //Declare a lazy static constant
    static let recipesVM: RecipeViewModel = {
     let recipesVM = RecipeViewModel()
     recipesVM.recipes = recipeListPreviewData
     return recipesVM
    }()
    
    static var previews: some View {
        TabBar()
            .environmentObject(RecipeViewModel())
            .environmentObject(recipesVM)

    }
}
