//
//  RecipeModel.swift
//  MiChef
//
//  Created by Austin Potts on 8/8/23.
//

import Foundation

enum Category: String, CaseIterable, Identifiable {
    var id: String  {self.rawValue}
    //This property Id is going to uniquely identify each case of the enum
    case breakfast = "Breakfast"
    case soup = "Soup"
    case salad = "Salad"
    case app = "Appetizer"
    case main = "Main"
    case side = "Side"
    case dessert  = "Dessert"
    case snack = "Snack"
    case drink = "Drink"
}

struct Recipe: Identifiable {
    let id = UUID()
    let name: String
    let image: String
    let description: String
    let ingredients: String
    let directions: String
    let category: Category.RawValue
    let datePublish: String
    let url: String
}

extension Recipe {
    
    static let all: [Recipe] = [Recipe(name: "Creamy Carrot Soup", image: "https://www.forksoverknives.com/wp-content/uploads/fly-images/98892/Creamy-Carrot-Soup-for-Wordpress-360x270-c.jpg", description: "This bold-hued soup is perfectly sweet and seriously comforting. Peeling the red bell pepper helps make this carrot soup extra silky. Dress it up with a drizzle of rich cashew cream, pomegranate seeds, and chopped fresh parsley for a festive fall presentation.", ingredients: "⅐ cup cashews \n medium onion, cut into ⅐-inch dice (2 cups) \ni pounds carrots, cut into ⅐-inch dice (3½ cups)\n red bell pepper, peeled and cut into ⅐-inch dice (1 cup) \n sprig fresh rosemary\n1 sprig fresh thymelni large fresh sage leaf\n4 cloves garlic, minced\n tablespoon lemon juicelnSea salt and freshly ground black pepper or cayenne pepper, to tasteln cup fresh pomegranate seeds \n2 tablespoons finely chopped fresh parsley", directions: "In a small bowl, cover the cashews with ½ cup hot water; let soak 20 minutes. Transfer cashews and remaining liquid to a blender; blend until smooth and creamy. Set aside. InIn a saucepan, combine onion, carrots, bell pepper, rosemary, thyme, sage, and garlic. Add ⅐ cup water and sauté over medium heat for 15 to 20 minutes, or until carrots are tender. nRemove pan from heat. Let vegetables cool for 10 minutes: then remove rosemary sprias and thyme leaf. Intransfer sauteed vegetables to a blender, and puree to a smooth paste. Return pureed vegetables to saucepan and add 3 cups water and 1 tablespoon lemon juice. Season with salt and pepper. Bring soup to boiling. InTo serve, place soup in individual bowls, drizzle with cashew cream, and garnish with pomegranate seeds and parsley", category: "Soup", datePublish: "2019-11-11", url: "https://www.forksoverknives.com/recipes/vegan-soups-stews/creamy-carrot-soup/"),
                                
                                Recipe(name: "Creamy Carrot Soup", image: "https://www.forksoverknives.com/wp-content/uploads/fly-images/98892/Creamy-Carrot-Soup-for-Wordpress-360x270-c.jpg", description: "This bold-hued soup is perfectly sweet and seriously comforting. Peeling the red bell pepper helps make this carrot soup extra silky. Dress it up with a drizzle of rich cashew cream, pomegranate seeds, and chopped fresh parsley for a festive fall presentation.", ingredients: "⅐ cup cashews \n medium onion, cut into ⅐-inch dice (2 cups) \ni pounds carrots, cut into ⅐-inch dice (3½ cups)\n red bell pepper, peeled and cut into ⅐-inch dice (1 cup) \n sprig fresh rosemary\n1 sprig fresh thymelni large fresh sage leaf\n4 cloves garlic, minced\n tablespoon lemon juicelnSea salt and freshly ground black pepper or cayenne pepper, to tasteln cup fresh pomegranate seeds \n2 tablespoons finely chopped fresh parsley", directions: "In a small bowl, cover the cashews with ½ cup hot water; let soak 20 minutes. Transfer cashews and remaining liquid to a blender; blend until smooth and creamy. Set aside. InIn a saucepan, combine onion, carrots, bell pepper, rosemary, thyme, sage, and garlic. Add ⅐ cup water and sauté over medium heat for 15 to 20 minutes, or until carrots are tender. nRemove pan from heat. Let vegetables cool for 10 minutes: then remove rosemary sprias and thyme leaf. Intransfer sauteed vegetables to a blender, and puree to a smooth paste. Return pureed vegetables to saucepan and add 3 cups water and 1 tablespoon lemon juice. Season with salt and pepper. Bring soup to boiling. InTo serve, place soup in individual bowls, drizzle with cashew cream, and garnish with pomegranate seeds and parsley", category: "Soup", datePublish: "2019-11-11", url: "https://www.forksoverknives.com/recipes/vegan-soups-stews/creamy-carrot-soup/"),
                                
                                Recipe(name: "Creamy Carrot Soup", image: "https://www.forksoverknives.com/wp-content/uploads/fly-images/98892/Creamy-Carrot-Soup-for-Wordpress-360x270-c.jpg", description: "This bold-hued soup is perfectly sweet and seriously comforting. Peeling the red bell pepper helps make this carrot soup extra silky. Dress it up with a drizzle of rich cashew cream, pomegranate seeds, and chopped fresh parsley for a festive fall presentation.", ingredients: " cup cashews \n medium onion, cut into ⅐-inch dice (2 cups) \ni pounds carrots, cut into ⅐-inch dice (3½ cups)\n red bell pepper, peeled and cut into ⅐-inch dice (1 cup) \n sprig fresh rosemary\n1 sprig fresh thymelni large fresh sage leaf\n4 cloves garlic, minced\n tablespoon lemon juicelnSea salt and freshly ground black pepper or cayenne pepper, to tasteln cup fresh pomegranate seeds \n2 tablespoons finely chopped fresh parsley", directions: "In a small bowl, cover the cashews with ½ cup hot water; let soak 20 minutes. Transfer cashews and remaining liquid to a blender; blend until smooth and creamy. Set aside. InIn a saucepan, combine onion, carrots, bell pepper, rosemary, thyme, sage, and garlic. Add ⅐ cup water and sauté over medium heat for 15 to 20 minutes, or until carrots are tender. nRemove pan from heat. Let vegetables cool for 10 minutes: then remove rosemary sprias and thyme leaf. Intransfer sauteed vegetables to a blender, and puree to a smooth paste. Return pureed vegetables to saucepan and add 3 cups water and 1 tablespoon lemon juice. Season with salt and pepper. Bring soup to boiling. InTo serve, place soup in individual bowls, drizzle with cashew cream, and garnish with pomegranate seeds and parsley", category: "Soup", datePublish: "2019-11-11", url: "https://www.forksoverknives.com/recipes/vegan-soups-stews/creamy-carrot-soup/"),
                                
                                
    
    
    
    
    
    ]
}
