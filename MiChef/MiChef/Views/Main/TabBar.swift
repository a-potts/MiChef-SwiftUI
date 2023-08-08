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

            
            AddRecipeView()
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
    static var previews: some View {
        TabBar()
    }
}
