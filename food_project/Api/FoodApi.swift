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
                var count = 1
                var ingredientsList : [String] = [""]
//                print(json)
//                print(json.dictionaryValue["meals"]!.dictionaryValue.keys)
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
//                                      ingredients: food["strIngredient1"].stringValue,
//                                      ingredient2: food["strIngredient2"].stringValue,
//                                      ingredient3: food["strIngredient3"].stringValue,
//                                      ingredient4: food["strIngredient4"].stringValue,
//                                      ingredient5: food["strIngredient5"].stringValue,
//                                      ingredient6: food["strIngredient6"].stringValue,
//                                      ingredient7: food["strIngredient7"].stringValue,
//                                      ingredient8: food["strIngredient8"].stringValue,
//                                      ingredient9: food["strIngredient9"].stringValue,
//                                      ingredient10: food["strIngredient10"].stringValue,
//                                      ingredient11: food["strIngredient11"].stringValue,
//                                      ingredient12: food["strIngredient12"].stringValue,
//                                      ingredient13: food["strIngredient13"].stringValue,
//                                      ingredient14: food["strIngredient14"].stringValue,
//                                      ingredient15: food["strIngredient15"].stringValue,
//                                      ingredient16: food["strIngredient16"].stringValue,
//                                      ingredient17: food["strIngredient17"].stringValue,
//                                      ingredient18: food["strIngredient18"].stringValue,
//                                      ingredient19: food["strIngredient19"].stringValue,
//                                      ingredient20: food["strIngredient20"].stringValue
                                     )
                                 )
                    /*let image = json.dictionaryValue["meals"]?.dictionaryValue[food]?["strMealThumb"].stringValue,
                       let content = json.dictionaryValue["meals"]?.dictionaryValue[food]?["strInstructions"].stringValue {
                        foods.append(Food(name: name,
                                          image: image,
                                          content: content)
                                     )*/
                    }
                // on retourne le resultat de la promesse
                seal.fulfill(foods)
                }
//                let foodsJSON = json.dictionaryValue["searchResults"]?.array?.first
//                for food in foodsJSON {
//                    foods.append(Food(name: food["name"].stringValue,
//                                           image: food["image"].stringValue,
//                                           content: food["content"].stringValue)
//                    )
//                }

            }
        }
    }
