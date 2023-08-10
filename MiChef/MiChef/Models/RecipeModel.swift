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

struct Recipe: Identifiable, Codable {
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
    
    static let all: [Recipe] = [
        
        Recipe(name: "Creamy Carrot Soup", image: "https://www.forksoverknives.com/wp-content/uploads/fly-images/98892/Creamy-Carrot-Soup-for-Wordpress-360x270-c.jpg", description: "This bold-hued soup is perfectly sweet and seriously comforting. Peeling the red bell pepper helps make this carrot soup extra silky. Dress it up with a drizzle of rich cashew cream, pomegranate seeds, and chopped fresh parsley for a festive fall presentation.", ingredients: "⅐ cup cashews \n medium onion, cut into ⅐-inch dice (2 cups) \ni pounds carrots, cut into ⅐-inch dice (3½ cups)\n red bell pepper, peeled and cut into ⅐-inch dice (1 cup) \n sprig fresh rosemary\n1 sprig fresh thymelni large fresh sage leaf\n4 cloves garlic, minced\n tablespoon lemon juicelnSea salt and freshly ground black pepper or cayenne pepper, to tasteln cup fresh pomegranate seeds \n2 tablespoons finely chopped fresh parsley", directions: "In a small bowl, cover the cashews with ½ cup hot water; let soak 20 minutes. Transfer cashews and remaining liquid to a blender; blend until smooth and creamy. Set aside. InIn a saucepan, combine onion, carrots, bell pepper, rosemary, thyme, sage, and garlic. Add ⅐ cup water and sauté over medium heat for 15 to 20 minutes, or until carrots are tender. nRemove pan from heat. Let vegetables cool for 10 minutes: then remove rosemary sprias and thyme leaf. Intransfer sauteed vegetables to a blender, and puree to a smooth paste. Return pureed vegetables to saucepan and add 3 cups water and 1 tablespoon lemon juice. Season with salt and pepper. Bring soup to boiling. InTo serve, place soup in individual bowls, drizzle with cashew cream, and garnish with pomegranate seeds and parsley", category: "Soup", datePublish: "2019-11-11", url: "https://www.forksoverknives.com/recipes/vegan-soups-stews/creamy-carrot-soup/"),
                                
        Recipe(name: "Vegan Italian Wedding Soupp", image: "https://www.forksoverknives.com/wp-content/uploads/fly-images/162561/Italian-Wedding-Soup-with-Lentil-Meatballs-wordpress-360x270-c.jpg", description: "Like a happy marriage, the flavors in this soup join together in perfect harmony. Traditional chicken stock is replaced by a rich veggie broth that’s infused with the lip-smacking flavors of tangy leeks and licorice-scented fennel. Carrots and green beans get delightfully tender as they soak up the savory broth and lend their earthy sweetness to the dish. And while classic recipes usually feature some sort of pasta for extra heft, our healthy, veganized version swaps in nutrient-rich red beans to keep you satiated. But the star of any Italian wedding soup is the meatballs. These lentil-based balls are packed full of zesty seasonings and baked until they’re crisp-on-the-outside and juicy-on-the-inside, making them perfect for both kids and adults. Plop as many as you want into each serving, and then sprinkle on some chopped parsley and cheesy nutritional yeast for a delicious finishing touch.", ingredients: "1 15-oz. can no-salt-added chickpeas, drained, and liquid (aquafaba) reserved. 1 cup cooked brown lentils. ¾ cup rolled oats. ½ cup chopped onion. 1 teaspoon Italian seasoning, crushed. ½ teaspoon garlic powder. ½ teaspoon freshly ground black pepper. 2 cups sliced leeks. 2 cups sliced carrots. 1 bulb fennel, thinly sliced. 3 cloves garlic, minced. 6 cups low-sodium vegetable broth. 2 cups frozen cut green beans. 1 15-oz. can no-salt-added red beans, rinsed and drained (1½ cups). Sea salt, to taste. ¼ cup chopped fresh flatleaf parsley. 2 tablespoons nutritional yeast", directions: "Preheat oven to 375°F. In a food processor combine the first seven ingredients (through pepper). Add ¼ cup aquafaba. Cover and pulse until mixture holds together. Form mixture into 1-inch balls. Place balls on a rimmed baking sheet. Bake 15 minutes. Meanwhile, in a large pot cook leeks, carrots, fennel, and garlic over medium 5 minutes, stirring occasionally and adding broth, 1 to 2 tablespoons at a time, as needed to prevent sticking. Add remaining broth, the green beans, and red beans. Increase heat to high. Bring to boiling; reduce heat. Cover and simmer 5 to 7 minutes or until vegetables are tender. Season with salt and additional black pepper. To serve, place hot meatballs in bowls. Ladle soup over meatballs. Sprinkle with parsley and nutritional yeast.", category: "Soup", datePublish: "2019-11-11", url: "https://www.forksoverknives.com/recipes/vegan-soups-stews/creamy-carrot-soup/"),
                                
            Recipe(name: "Roasted Tomato, White Bean, and Olive Bruschetta", image: "https://www.forksoverknives.com/wp-content/uploads/fly-images/163037/Roasted-Bruschetta-Tomatoes-wordpress-360x270-c.jpg", description: "The natural sugar content of campari tomatoes makes them perfect for roasting because they get deliciously soft and sweet the longer they bake. This easy bruschetta dish combines the juicy tomatoes with hearty cannellini beans, briny olives, tangy red onion, and a sprinkling of fresh Italian herbs before popping everything in the oven so the flavors can meld together. If you’re tempted to eat the veggie mixture straight out of the pan, we wouldn’t blame you! But this succulent recipe tastes even better when it’s spooned onto slices of toasted whole wheat bread for an appetizer-style snack. Be sure to drizzle the delicious pan juices over the toasts to infuse each bite with extra Mediterranean flair. You can also serve this flavorful tomato mixture over pasta or whole grains.", ingredients: "2 15-oz. cans no-salt-added cannellini beans, rinsed and drained (3 cups). 2½ cups slivered red onion. ½ cup Castelvetrano olives, halved and/or quartered. 6 cloves garlic, slivered. ¼ cup fresh herb sprigs, such as oregano, basil, thyme, and/or rosemary. 2 lb. Campari tomatoes, halved and/or quartered, and/or whole cherry tomatoes on the stem. ¼ cup white wine or low-sodium vegetable broth. 2 tablespoons white balsamic vinegar. Cracked black pepper. 1 loaf whole grain French bread, sliced and toasted, or 12 oz. dry whole wheat pasta, cooked according to package directions, or 4 cups hot cooked quinoa or other grain", directions: "Preheat oven to 400°F. Line a 15×10-inch baking pan with parchment paper or a silicone baking mat. Arrange beans in center of pan in a 1-inch-thick oval. Top with onion, olives, garlic, and herb sprigs. Top with tomatoes. Drizzle with wine and vinegar. Bake 35 to 40 minutes or until tomatoes start to brown and are very soft. Sprinkle with pepper. Spoon tomato mixture over toasted whole wheat French bread, pasta, quinoa, or other whole grains.", category: "Appetizer", datePublish: "2019-11-11", url: "https://www.forksoverknives.com/recipes/vegan-soups-stews/creamy-carrot-soup/"),
                                
                                
                                
                                
                                
                                
                                
    ]
}







