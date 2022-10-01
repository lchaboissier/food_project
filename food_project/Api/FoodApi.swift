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
//        https://www.themealdb.com/api/json/v1/1/search.php?s=
//        https://pizza-and-desserts.p.rapidapi.com/pizzas?rapidapi-key=5ad99fb953msh570c6c6e4fc0156p17034cjsn615241b69dad
            AF.request("https://www.themealdb.com/api/json/v1/1/search.php?s=").response { response in
                let json = JSON(response.data as Any)
//                print(json)
//                print(json.dictionaryValue["meals"]!.dictionaryValue.keys)
                let foodsJSON = json.dictionaryValue["meals"]!.arrayValue
                for food in foodsJSON {
                    foods.append(Food(name: food["strMeal"].stringValue,
                                      image: food["strMealThumb"].stringValue,
                                      content: food["strInstructions"].stringValue)
                                 )
                    /*let image = json.dictionaryValue["meals"]?.dictionaryValue[food]?["strMealThumb"].stringValue,
                       let content = json.dictionaryValue["meals"]?.dictionaryValue[food]?["strInstructions"].stringValue {
                        foods.append(Food(name: name,
                                          image: image,
                                          content: content)
                                     )*/
                    }
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
