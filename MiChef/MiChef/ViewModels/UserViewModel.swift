//
//  UserViewModel.swift
//  MiChef
//
//  Created by Austin Potts on 8/9/23.
//

import Foundation
import Firebase
import FirebaseAuth



class UserViewModel: ObservableObject {
    
    func registerVM(email: String, password: String){
        Auth.auth().createUser(withEmail: email, password: password)
    }
    
    func login(email: String, password: String){
        Auth.auth().signIn(withEmail: email, password: password)
    }

    func signOut() {
        do {
          try Auth.auth().signOut()
        }
        catch {
          print(error)
        }
      }
    
    init(){
    }
    
}



