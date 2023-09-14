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
    @EnvironmentObject var userVM: UserViewModel
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationView {
            
 
       
            
            ScrollView {
                //MARK: View Model handling the data
                RecipeList(recipes: recipesVM.recipes)
            }
            .navigationTitle("My Recipes")
            .toolbar {
                //MARK: Logout Icon
                ToolbarItem(placement: .navigationBarLeading) {
                    
                
                  
                   
                    
                }
            }
            
            
           
            
        }
        .navigationViewStyle(.stack)
    }
}

struct HomeView_Previews: PreviewProvider {
    
    //This is a trick to force data to the preview model
    //Need to add this since we declared a insatce of the property above, it will have no value when the process reaches it so we must set one
    //Declare a lazy static constant
    static let recipesVM: RecipeViewModel = {
     let recipesVM = RecipeViewModel()
     recipesVM.recipes = recipeListPreviewData
     return recipesVM
    }()
    
    static var previews: some View {
        HomeView()
            .environmentObject(RecipeViewModel())
            .environmentObject(recipesVM)
        
            
            
    }
}
