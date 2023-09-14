//
//  SettingsView.swift
//  MiChef
//
//  Created by Austin Potts on 8/8/23.
//

import SwiftUI

struct SettingsView: View {
    
    var userVM: UserViewModel = UserViewModel()
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationView {
            //MARK: SIGN OUT Button
               
                    
                Button(action:  {
                    print("logout pressed")
                    userVM.signOut()
                  
                    
                    dismiss()
                    
                    
                }) {
                       
                        Text("Sign Out")
                        .foregroundColor(.white)
                        .bold()
                        .frame(width: 300, height: 50)
                        .background (Color.red)
                        .cornerRadius (10)                    }
                      
                        .navigationTitle("v1.1.0")
        }
        
        
        .navigationViewStyle(.stack)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
