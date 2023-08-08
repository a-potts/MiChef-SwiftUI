//
//  NewRecipeView.swift
//  MiChef
//
//  Created by Austin Potts on 8/8/23.
//

import SwiftUI

struct NewRecipeView: View {
    @State private var showAddRecipe: Bool = false
    
    var body: some View {
        NavigationView {
            Button("Add Recipe Manually") {
                showAddRecipe.toggle()
            }
                .navigationTitle("New Recipe")
        }
        .navigationViewStyle(.stack)
        .sheet(isPresented: $showAddRecipe) {
            AddRecipeView()
        }
    }
}

struct NewRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        NewRecipeView()
    }
}
