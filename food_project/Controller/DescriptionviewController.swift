//
//  DescriptionviewController.swift
//  food_project
//
//  Created by Luca Chaboissier on 01/10/2022.
//

import UIKit
import WebKit

class DescriptionviewController: UIViewController {


    @IBOutlet var descImage: UIImageView!
    @IBOutlet weak var descTitle: UILabel!
    @IBOutlet weak var descContent: UITextView!
    @IBOutlet weak var descIngredients: UILabel!
    
    var food: Food? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        descImage.layer.masksToBounds = true
        descImage.layer.cornerRadius = 8
        
        if let safeFood = food {
            
//            self.title = safeFood.name
            self.descTitle.text = safeFood.name
            self.descContent.text = safeFood.content
//            var desc = 1
//            while desc < 20 {
//                var ing = safeFood.ingredient"\(desc)"
//                ing = String(ing)
//                if ing.count() > 2 {
//                    self.descIngredients.text! += ing + ", "
//                }
//                desc += 1
//            }
            
            self.descIngredients.text = safeFood.ingredient1 + ", " + safeFood.ingredient2 + ", " + safeFood.ingredient3 + ", " +  safeFood.ingredient4 + ", " +  safeFood.ingredient5 + ", " +  safeFood.ingredient6 + ", " +  safeFood.ingredient7 + ", " +  safeFood.ingredient8 + ", " +  safeFood.ingredient9 + ", " +  safeFood.ingredient10 + ", " +  safeFood.ingredient11 + ", " +  safeFood.ingredient12 + ", " +  safeFood.ingredient13 + ", " +  safeFood.ingredient14 + ", " +  safeFood.ingredient15 + ", " +  safeFood.ingredient16 + ", " +  safeFood.ingredient17 + ", " +  safeFood.ingredient18 + ", " +  safeFood.ingredient19 + ", " +  safeFood.ingredient20

            if let url = URL(string: safeFood.imgFood), let imgData = try? Data(contentsOf: url) {
                let uiImageData = UIImage(data: imgData)
                descImage.image = uiImageData
            }
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
}
