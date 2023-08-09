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

    
    init(){
    }
    
}



