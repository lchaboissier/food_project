//
//  Food.swift
//  food_project
//
//  Created by Luca Chaboissier on 30/09/2022.
//

class Food {
    
    let name: String
    let imgFood: String
    let content: String
    let tags: String
    let ingredients: [String]

    
    
    init(name: String, imgFood: String, content: String, tags: String, ingredients: [String])  {
        self.name = name
        self.imgFood = imgFood
        self.content = content
        self.tags = tags
        self.ingredients = ingredients
    }
}
