//
//  RecipeCard.swift
//  MiChef
//
//  Created by Austin Potts on 8/8/23.
//

import SwiftUI

struct RecipeCard: View {
    
   // var recipesVM: RecipeViewModel
    
    
    
    var recipe: Recipe
    
    
    
    
    var body: some View {
        
        VStack {
            //cannot add modifiers to aysnc image but on the image in the closure instead
            AsyncImage(url: URL(string: recipe.image)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .overlay(alignment: .bottom) {
                        Text(recipe.name)
                            .font(.headline)
                            .foregroundColor(.white)
                            .shadow(color: .black, radius: 3, x: 0, y: 0)
                            .frame(maxWidth: 136)
                            .padding()
                    }
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40, alignment: .center)
                    .foregroundColor(.white.opacity(0.7))
                    .shadow(color: .black, radius: 3, x: 0, y: 0)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    
         }
            
      }
        .frame(width: 160, height: 217, alignment: .top)
        .background(LinearGradient(gradient: Gradient(colors: [Color(.gray).opacity(0.3), Color(.gray)]), startPoint: .top, endPoint: .bottom))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: Color.black.opacity(0.3), radius: 15, x: 0, y: 10)

    }
}

struct RecipeCard_Previews: PreviewProvider {
    static var previews: some View {
        RecipeView(recipe: RecipeViewModel().recipes[0])
    }
}
