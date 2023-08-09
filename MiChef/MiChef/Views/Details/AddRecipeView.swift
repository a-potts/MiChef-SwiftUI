//
//  AddRecipeView.swift
//  MiChef
//
//  Created by Austin Potts on 8/8/23.
//

import SwiftUI

struct AddRecipeView: View {
    
    //These states are used within this view only, apple suggests they must be private
    @State private var name: String = ""
    @State private var selectedCategory: Category = Category.main
    @State private var description: String = ""
    @State private var ingredients: String = ""
    @State private var directions: String = ""
    
    @State private var navigateToRecipe: Bool = false
    
    @EnvironmentObject var recipesVM: RecipeViewModel

    //swift ui provides a handler to dismiss a presentation, that handler is made availbe in the environment value
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            Form{
                //Binding Arguement is recognized by $
                Section(header: Text("Name")) {
                    TextField("Recipe Name", text: $name)
                }
                Section(header: Text("Category")) {
                    Picker("Category", selection: $selectedCategory) {
                        
                        //For each auto assigns tags per each item id, sometimes it doesnt work so add the tag modifier anyway
                        ForEach(Category.allCases) { category in
                            Text(category.rawValue)
                                .tag(category)
                        }
                    }
                    .pickerStyle(.menu)
                }
                
                Section(header: Text("Description")) {
                    TextEditor(text: $description)
                    
                }
                Section(header: Text("Ingredients")) {
                    TextEditor(text: $ingredients)
                    
                }
                Section(header: Text("Directions")) {
                    TextEditor(text: $directions)
                    
                }
                
            }
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        //MARK: BUTTON ACTION
                        //Leave Action Empty for now
                        dismiss()
                    } label: {
                        Label("Cancel", systemImage: "xmark")
                            .labelStyle(.iconOnly)
                    }

                }
                
                ToolbarItem {
                    NavigationLink(destination: RecipeView(recipe: recipesVM.recipes.sorted{ $0.datePublish > $1.datePublish }[0]), isActive: $navigateToRecipe) {
                        
                        Button {
                            //Leave Action Empty for now
                            navigateToRecipe = true
                        } label: {
                            Label("Done", systemImage: "checkmark")
                                .labelStyle(.iconOnly)
                        }
                    }
                    .navigationBarBackButtonHidden(true)
                    .disabled(name.isEmpty)

                   

                }
            })
            .navigationTitle("New Recipe")
            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationViewStyle(.stack)
    }
}

struct AddRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        AddRecipeView()
    }
}
