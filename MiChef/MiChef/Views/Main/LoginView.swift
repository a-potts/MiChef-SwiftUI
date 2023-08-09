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
   
    var userVM: UserViewModel = UserViewModel()
    
    
    @Environment(\.dismiss) var dismiss
    

    
    var body: some View {
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
                userVM.registerVM(email: name, password: password)
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
            
            
            
            

            

        }
        .frame(width: 350, height: 350, alignment: .center)
        //This removes the form bg color
        .scrollContentBackground(.hidden)
    }
    
   
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .preferredColorScheme(.light)
        
            
    }
}
