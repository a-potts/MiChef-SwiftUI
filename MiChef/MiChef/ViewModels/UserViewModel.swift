//
//  UserViewModel.swift
//  MiChef
//
//  Created by Austin Potts on 8/9/23.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseDatabase



class UserViewModel: ObservableObject {
    
    func registerVM(email: String, password: String){
        Auth.auth().createUser(withEmail: email, password: password)
        
        guard let uuid = Auth.auth().currentUser?.uid else {
            return
        }
        
        
        
        let userData = ["email": email, "uuid": uuid]
        
        Firestore.firestore().collection("users").document(uuid).setData(userData) { error in
            if let error = error {
                print(error)
                return
            }
            print("SUCCESS!! USERVM")
        }
    }
    
    
    func login(email: String, password: String){
        Auth.auth().signIn(withEmail: email, password: password) { auth, error in
            if let maybeError = error { //if there was an error, handle it
                let err = maybeError as NSError
                switch err.code {
                case AuthErrorCode.wrongPassword.rawValue:
                    print("wrong password")
                case AuthErrorCode.invalidEmail.rawValue:
                    print("invalid email")
                case AuthErrorCode.accountExistsWithDifferentCredential.rawValue:
                    print("accountExistsWithDifferentCredential")
                    
                default:
                    print("unknown error: \(err.localizedDescription)")
                }
            }
        }
    
        
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



