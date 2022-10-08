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
    static func getFoods(tag: String? = nil) -> Promise<[Food]> {
        var foods: [Food] = []
        
        // Gestion de l'asynchrone, on retourne une promesse
        return Promise { seal in
            if let tagSafe = tag {
                // On fait l'appel dans la promesse
                AF.request("https://www.themealdb.com/api/json/v1/1/search.php?s=\(tagSafe)").response { response in
                    let json = JSON(response.data as Any)
                    var count = 1
                    var ingredientsList : [String] = [""]
                    let foodsJSON = json.dictionaryValue["meals"]!.arrayValue
                    for food in foodsJSON {
                        while count <= 20 {
                            if (food["strIngredient\(count)"].stringValue != ""){
                                ingredientsList.append(food["strIngredient\(count)"].stringValue)
                            }
                             count += 1
                         }
                        foods.append(Food(name: food["strMeal"].stringValue,
                                          imgFood: food["strMealThumb"].stringValue,
                                          content: food["strInstructions"].stringValue,
                                          tags: food["strTags"].stringValue,
                                          ingredients: ingredientsList
                                         )
                                     )
                        }
                    // on retourne le resultat de la promesse
                    seal.fulfill(foods)
                    }
            } else {
                // On fait l'appel dans la promesse
                AF.request("https://www.themealdb.com/api/json/v1/1/search.php?s=").response { response in
                    let json = JSON(response.data as Any)
                    var count = 1
                    var ingredientsList : [String] = [""]
                    let foodsJSON = json.dictionaryValue["meals"]!.arrayValue
                    for food in foodsJSON {
                        while count <= 20 {
                            if (food["strIngredient\(count)"].stringValue != ""){
                                ingredientsList.append(food["strIngredient\(count)"].stringValue)
                            }
                             count += 1
                         }
                        foods.append(Food(name: food["strMeal"].stringValue,
                                          imgFood: food["strMealThumb"].stringValue,
                                          content: food["strInstructions"].stringValue,
                                          tags: food["strTags"].stringValue,
                                          ingredients: ingredientsList
                                         )
                                     )
                        }
                    // on retourne le resultat de la promesse
                    seal.fulfill(foods)
                    }
            }
            
            }
        }
    }
