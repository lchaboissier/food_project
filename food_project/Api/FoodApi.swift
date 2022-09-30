//
//  FoodApi.swift
//  food_project
//
//  Created by Luca Chaboissier on 30/09/2022.
//

import Alamofire
import SwiftyJSON
import PromiseKit


class FoodApi {
    //Fonction static pour ne pas a avoir a l'instancier a chaque fois qu'on veux la call
    static func getFoods() -> Promise<[Food]> {
        var foods: [Food] = []
        
        // Gestion de l'asynchrone, on retourne une promesse
        return Promise { seal in
            // On fait l'appel dans la promesse
            AF.request("https://api.spoonacular.com/food/search?query=burger&apiKey=748cb7d922484c1585014f1b5ae95677").response { response in
                let json = JSON(response.data)
                let foodsJSON = json.arrayValue
//                let foodsJSON = json.dictionaryValue["searchResults"]?.array?.first
//                for food in foodsJSON {
//                    foods.append(Food(name: food["name"].stringValue,
//                                           image: food["image"].stringValue,
//                                           content: food["content"].stringValue)
//                    )
//                }
                // on retourne le resultat de la promesse
                seal.fulfill(foods)
            }
        }
    }
}
