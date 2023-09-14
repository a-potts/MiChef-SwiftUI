//
//  AddRecipeView.swift
//  MiChef
//
//  Created by Austin Potts on 8/8/23.
//

import SwiftUI
import Firebase
import FirebaseDatabase
import FirebaseFirestore
import PhotosUI
import FirebaseStorage

struct AddRecipeView: View {
    

    
    //These states are used within this view only, apple suggests they must be private
    @State private var name: String = ""
    @State private var selectedCategory: Category = Category.main
    @State private var description: String = ""
    @State private var ingredients: String = ""
    @State private var directions: String = ""
    
    @State private var navigateToRecipe: Bool = false
    
    @EnvironmentObject var recipesVM: RecipeViewModel
    
    //MARK: Image Picker
    @State var selectedItems: [PhotosPickerItem] = []
    @State var data: Data?
    @State var image: UIImage?
    

    //swift ui provides a handler to dismiss a presentation, that handler is made availbe in the environment value
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            Form{
                //Binding Arguement is recognized by $
                Section(header: Text("Name")) {
                    TextField("Recipe Name", text: $name)
                }
                Section(header: Text("Category")) {
                    Picker("Category", selection: $selectedCategory) {
                        
                        //For each auto assigns tags per each item id, sometimes it doesnt work so add the tag modifier anyway
                        ForEach(Category.allCases) { category in
                            Text(category.rawValue)
                                .tag(category)
                        }
                    }
                    .pickerStyle(.menu)
                }
                
                Section(header: Text("Description")) {
                    TextEditor(text: $description)
                    
                }
                Section(header: Text("Ingredients")) {
                    TextEditor(text: $ingredients)
                    
                }
                Section(header: Text("Directions")) {
                    TextEditor(text: $directions)
                    
                }
                
               
                
                Section(header: Text("Image") ) {
                    PhotosPicker(selection: $selectedItems, maxSelectionCount: 1, matching: .images) {
                        Text("Image Picker")
                    }
                    .onChange(of: selectedItems) { newValue in
                        guard let item = selectedItems.first else {
                            return
                        }
                        item.loadTransferable(type: Data.self) { result in
                            switch result {
                            case .success(let data):
                                if let data = data {
                                    self.data = data
                                    
                                    self.image = UIImage(data: data)
                                } else {
                                    print("Data is nil")
                                }
                            case .failure(let failure):
                                fatalError()
                            }
                        }
                    }
                    
                    if let data = data, let image = UIImage(data: data) {
                        
                        
                        
                        Image(uiImage: image)
                            .resizable()
                    }
                }
                
               
                
            }
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                       
                        dismiss()
                    } label: {
                        Label("Cancel", systemImage: "xmark")
                            .labelStyle(.iconOnly)
                    }

                }
                
                ToolbarItem {
                    
                    //destination is the RecipeView whos recipe is the most recent of the list
                    
                    //Before I was using sort to compare the latest data entry by date, when connected to firebase this result prints correclty but returns incorrectly in the app. I created a work around below by creating an object on the view for the user to see temporarily
                                            
                        
                        Button {
                            //MARK: SAVE RECIPE
                           

                            saveRecipe()
                            dismiss()
                          
                            
                            
                            
                            //isActive is so we know to only activate when done button is tapped - which is of type binding boolean
                            navigateToRecipe = true
                        } label: {
                            Label("Done", systemImage: "checkmark")
                                .labelStyle(.iconOnly)
                        }
                    
                    .navigationBarBackButtonHidden(true)
                    .disabled(name.isEmpty)

                   

                }
            })
            .navigationTitle("New Recipe")
            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationViewStyle(.stack)
    }
    
    
    //MARK: ADD Firebase Functionality - REMOVE THIS FROM THE VIEW & PUT INTO VIEW MODEL
    
//    private func persistImage(){
//
//        guard let uid = Auth.auth().currentUser?.uid else {
//            return
//        }
//
//        guard let imageData = self.image?.jpegData(compressionQuality: 0.5) else {
//            return
//        }
//
//        let ref = Storage.storage().reference(withPath: uid)
//        ref.putData(imageData, metadata: nil) { metadata, error in
//            if let error = error {
//                print("Fail Image")
//                return
//            }
//
////            //Fecth
////            ref.downloadURL { url, error in
////
////                if let error = error {
////                    print("Fail Image")
////                    return
////                }
////            }
//
//
//        }
//    }
    
    private func saveRecipe(){
        
        
        
        let now = Date()
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "MMM dd, yyyy 'at' hh:mm a"
        let datePublish = dateFormatter.string(from: now)
        print(datePublish)
        
        
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        
        //Image
        guard let imageData = self.image?.jpegData(compressionQuality: 0.5) else {
            return
        }
        
        let uuID = UUID()
        
        let metaData = StorageMetadata()
        metaData.contentType = "image/jpg"
        
        //Image
        var imageString: String = ""
        
        let ref = Storage.storage().reference(withPath: uid).child("images/\(name)")
        ref.putData(imageData, metadata: metaData) { metadata, error in
            if let error = error {
                print("Fail Image")
                return
            }
            // Fetch - Not working but doesnt matter? It does because I need this URL string to pass to my view card
             ref.downloadURL { url, error in

                 
                 if let error = error {
                     print("Fail Image fetch \(error)")
                     return
                 }

                 guard let urlString = url?.absoluteString else {return}
                 print("Success String \(urlString)")

                 imageString = urlString
                 
                 
                 let recipe: [String : Any] = [
                     "name": name,
                     "image": imageString,
                     "description": description,
                     "ingredients": ingredients,
                     "directions": directions,
                     "category": selectedCategory.rawValue,
                     "datePublish": datePublish,
                     "url": ""
                     ]
                 
                
                 
                           
                 let db = Firestore.firestore().collection("users").document(uid).collection("Recipes")
                 
                 
                 db.addDocument(data: recipe)
                 
                 recipesVM.recipes.append(Recipe(name: name, image: imageString, description: description, ingredients: ingredients, directions: directions, category: selectedCategory.rawValue, datePublish: datePublish, url: ""))
                 
             }
            
          
            
        }
        
        
        
        
     
        
        
      }
    
    
    
    
    
    
    
    
}

struct AddRecipeView_Previews: PreviewProvider {
    //This is a trick to force data to the preview model
    //Need to add this since we declared a insatce of the property above, it will have no value when the process reaches it so we must set one
    //Declare a lazy static constant
    static let recipesVM: RecipeViewModel = {
     let recipesVM = RecipeViewModel()
     recipesVM.recipes = recipeListPreviewData
     return recipesVM
    }()
    
    static var previews: some View {
        AddRecipeView()
            .environmentObject(recipesVM)
    }
}


    
    
 

