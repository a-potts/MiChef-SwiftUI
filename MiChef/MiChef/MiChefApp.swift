//
//  MiChefApp.swift
//  MiChef
//
//  Created by Austin Potts on 8/8/23.
//

import SwiftUI

@main
struct MiChefApp: App {
    //Only init when app launches
    @StateObject var recipesViewModel = RecipeViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(recipesViewModel)
            //this will allow any child of ContentView, to access the view model
        }
    }
}
