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
    var desc: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        descImage.layer.masksToBounds = true
        descImage.layer.cornerRadius = 8
        
        if let safeFood = food {
            self.descTitle.text = safeFood.name
            self.descContent.text = safeFood.content
            self.descIngredients.text = safeFood.ingredients.joined(separator: ", ")
            
            if let url = URL(string: safeFood.imgFood), let imgData = try? Data(contentsOf: url) {
                let uiImageData = UIImage(data: imgData)
                descImage.image = uiImageData
            }
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
}
