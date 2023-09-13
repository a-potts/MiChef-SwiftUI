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
    
   
    
    //Using @State to update the views on a struct, accessing the binding properties
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    
    
    @State private var registerButtonTapped: Bool = false
    @State private var loginButtonTapped: Bool = false

    
    @State private var viewTitle: String = "Welcome!"
    @State private var vregisterTitle: String = "Register"

   
    @State private var showingSheet = false

    @State private var usernameTextField: String = ""
    @State private var passwordTextField: String = ""

    
    
    var body: some View {
        
        NavigationView {
            ZStack {
                Color.blue
                    .ignoresSafeArea()
                Circle()
                    .scale(1.7)
                    .foregroundColor(.white.opacity(0.15))
               
                
                VStack {
                    Text(viewTitle)
                        .font(.largeTitle)
                        .bold()
                        .padding()
                        .foregroundColor(.white)
                    TextField("Username", text: $name)
                        .padding()
                        .frame(width: 300, height: 50) .background (Color.white.opacity (0.8))                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongUsername))
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .frame(width: 300, height: 50) .background (Color.white.opacity (0.8))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongPassword))
                    
                    
                    //MARK: Login
                    
                    if registerButtonTapped != true {
                        
                        
                        Button("Login") {
                            
                            
                            print("tapped")
                           userVM.signOut()
                           
                            self.wrongUsername = 0
                            self.wrongPassword = 0
                            
                            // Authenticate user
                            Auth.auth().signIn(withEmail: name, password: password) { auth, error in
                                if let maybeError = error { //if there was an error, handle it
                                    
                                    let err = maybeError as NSError
                                    switch err.code {
                                    case AuthErrorCode.wrongPassword.rawValue:
                                        self.wrongPassword = 1
                                        print("wrong password")
                                    case AuthErrorCode.invalidEmail.rawValue:
                                        self.wrongUsername = 1
                                        print("invalid email")
                                    case AuthErrorCode.accountExistsWithDifferentCredential.rawValue:
                                        print("accountExistsWithDifferentCredential")
                                        
                                    default:
                                        print("unknown error: \(err.localizedDescription)")
                                        self.wrongPassword = 1
                                        self.wrongUsername = 1
                                    }
                                }
                                
                            }
                            
                                
                            
                            Auth.auth().addStateDidChangeListener { auth, user in
                                
                                
                                // if there is a user, toggle the boolean true
                                if user != nil {
                                    print("User is not Nil \(user?.email ?? "Email")")
                                //    userIsLoggedIn.toggle()
                                    
                                    //MARK: Call to View Model if user logs in
                                //    recipesVM.getExpenses()
                                    recipesVM.getRecipes()
                                    
                                    if showingSheet == true { //if its on, turn it off
                                        showingSheet.toggle() // off
                                        
                                        // I only want to clear these if the user can login
                                        self.name = ""
                                        self.password = ""
                                        


                                    }
                                    
                                    //FIX: This works but has to be done twice with Login button tapping. Why?
                                    showingSheet.toggle()
                                    
                                    self.wrongPassword = 0
                                    self.wrongPassword = 0
                                
                                    
                                    
                                    
                                    
                                } else if user == nil {
                                    print("User is Nil \(user)")
                                }
                                //showingSheet.toggle()
                                // I only want to clear these if the user can login
                                self.name = ""
                                self.password = ""
                                
                            }
                            
                            
                        }
                        .foregroundColor(.white)
                        .bold()
                        .frame(width: 300, height: 50)
                        .background (Color.blue)
                        .cornerRadius (10)
                        
                        
                        .fullScreenCover(isPresented: $showingSheet, content: {
                            
                            ContentView()
                                .environmentObject(self.recipesVM)
                            
                        })

                        
                        Button("No account?") {
                            print("tapped")
                            
                            self.wrongPassword = 0
                            self.wrongUsername = 0

                            self.name = ""
                            self.password = ""
                            
                            //Toggle a boolean that lets the view know to change i.e register tapped = true
                            registerButtonTapped.toggle()
                            //If true, replace login button + logic with register button + logic
                            
                         
                          
                            self.viewTitle = "Register"
                            
                        }
                        .foregroundColor(Color.white)
                        .bold()
                        
                    }
                    
                    if registerButtonTapped == true {
                        //MARK: Register
                        Button("Register") {
                            
                          
                            
                            
                            print("tapped")
                            
                            // Authenticate user
                            userVM.signOut()
                            userVM.registerVM(email: name, password: password)
                            
                            Auth.auth().addStateDidChangeListener { auth, user in
                                // if there is a user, toggle the boolean true
                                if user != nil {
                                    print(user?.email ?? "Error Logging In")
                                  //  userIsLoggedIn.toggle()
                                    showingSheet.toggle()
                                    self.viewTitle = "Login"
                                    registerButtonTapped.toggle() //to false
                                    self.wrongPassword = 0
                                    self.wrongUsername = 0
                                    
                                } else {
                                    print("Error Register")
                                    wrongPassword = 1
                                    wrongUsername = 1
                                }
                            }
                        }
                        .bold()
                        .foregroundColor(.white)
                        .frame(width: 300, height: 50)
                        .background (Color.red)
                        .cornerRadius (10)
                        .fullScreenCover(isPresented: $showingSheet, content: {
                            
                            ContentView()
                                .environmentObject(self.recipesVM)
                        })
                        
                        Button("Have an account?") {
                            print("tapped")
                            
                            //Toggle a boolean that lets the view know to change i.e register tapped = true
                            registerButtonTapped.toggle()
                            //If true, replace login button + logic with register button + logic
                            self.viewTitle = "Welcome!"
                            self.wrongPassword = 0
                            self.wrongUsername = 0
                            
                        }
                        .bold()
                        .foregroundColor(Color.white)
                        
                    }
                 
                }
                
            }
        }
        
    }
}

struct LoginView_Previews: PreviewProvider {
    
    //This is a trick to force data to the preview model
    //Need to add this since we declared a insatce of the property above, it will have no value when the process reaches it so we must set one
    //Declare a lazy static constant
    static let recipesVM: RecipeViewModel = {
     let recipesVM = RecipeViewModel()
     recipesVM.recipes = recipeListPreviewData
     return recipesVM
    }()

    
    
    static var previews: some View {
        
        
        LoginView()
            .preferredColorScheme(.light)

            .environmentObject(recipesVM)
        
        ContentView()
            .environmentObject(recipesVM)
    
    }
}
