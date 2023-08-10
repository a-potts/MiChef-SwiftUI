//
//  LoginView.swift
//  MiChef
//
//  Created by Austin Potts on 8/9/23.
//

import SwiftUI
import Combine
import FirebaseAnalyticsSwift
import Firebase

struct LoginView: View {
    
    @State private var name: String = ""
    @State private var password: String = ""
    @EnvironmentObject var recipesVM: RecipeViewModel

    var userVM: UserViewModel = UserViewModel()
    
    
    @State private var userIsLoggedIn: Bool = false
    
    
    @Environment(\.dismiss) var dismiss
    

    
    var body: some View {
        
        if userIsLoggedIn == true {
            
            //Becasue this view now becomes the ancestor of RecipesViewModel, we need to add it to environment object
            HomeView()
                .environmentObject(RecipeViewModel())
                
        } else {
            content
        }
    }
    
    var content: some View {
        
        
        Form {
            VStack {
                Section  {
                    TextField("Enter Email", text: $name)
                        .padding()
                }
                .padding(.bottom)
                .padding(.top)
                
                Divider()
                
                Section {
                    TextField("Enter Pasword", text: $password)
                        .padding()
                }
                .padding(.bottom)
                .padding(.top)

            }
            //.background(.gray)
            .cornerRadius(5)

            //MARK: Login Button
            Button(action: {
                userVM.login(email: name, password: password)
                
                
                Auth.auth().addStateDidChangeListener { auth, user in
                    // if there is a user, toggle the boolean true
                    if user != nil {
                        print(user?.email ?? "Error Logging In")
                        userIsLoggedIn.toggle()
                    } else {
                        print("Error Logging in")
                    }
                }
                    

                
                //Use the ViewModel to login / register a user via firebase
                
                //Use Navigation to push
                
                
            }, label: {
                HStack {
                    Spacer()
                    Text("Login")
                        .padding()
                        .foregroundColor(.white)
                    Spacer()
                }
            })
            .background(.brown)
            .cornerRadius(5)
            
            //MARK: Register Button
            Button(action: {
                userVM.registerVM(email: name, password: password)
                //Use the ViewModel to login / register a user via firebase
                
                //Use Navigation to push
                
            }, label: {
                HStack {
                    Spacer()
                    Text("Register")
                        .padding()
                        .foregroundColor(.white)
                    Spacer()
                }
            })
            .background(.green)
            .cornerRadius(5)
            
            //MARK: SignOut Button
            Button(action: {
                userVM.signOut()
                //Use the ViewModel to login / register a user via firebase
                
                //Use Navigation to push
                
            }, label: {
                HStack {
                    Spacer()
                    Text("Sign Out")
                        .padding()
                        .foregroundColor(.white)
                    Spacer()
                }
            })
            .background(.red)
            .cornerRadius(5)

            

        }
        .frame(width: 350, height: 500, alignment: .center)
        //This removes the form bg color
        .scrollContentBackground(.hidden)
        .onAppear() {
            Auth.auth().addStateDidChangeListener { auth, user in
                // if there is a user, toggle the boolean true
                if user != nil {
                    userIsLoggedIn.toggle()
                }
            }
        }
    }
    
   
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .preferredColorScheme(.light)
        
    
    }
}
