//
//  MiChefApp.swift
//  MiChef
//
//  Created by Austin Potts on 8/8/23.
//

import SwiftUI
import Firebase

@main
struct MiChefApp: App {
    //Only init when app launches
    @StateObject var recipesViewModel = RecipeViewModel()
    @StateObject var userVM = UserViewModel()

    
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
          //  LoginView()
            //    .environmentObject(userVM)
            
             ContentView()
                .environmentObject(recipesViewModel)
            //this will allow any child of ContentView, to access the view model
        }
     
    }
}
