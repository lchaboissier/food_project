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
            AF.request("https://pizza-and-desserts.p.rapidapi.com/pizzas?rapidapi-key=5ad99fb953msh570c6c6e4fc0156p17034cjsn615241b69dad").response { response in
                let json = JSON(response.data as Any)
                let foodsJSON = json.arrayValue
                for food in foodsJSON {
                    foods.append(Food(name: food["name"].stringValue,
                                      image: food["img"].stringValue,
                                      content: food["description"].stringValue)
                    )
                }
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
