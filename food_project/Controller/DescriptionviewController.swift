//
//  DescriptionviewController.swift
//  food_project
//
//  Created by Luca Chaboissier on 01/10/2022.
//

import UIKit
import WebKit

class DescriptionviewController: UIViewController {

    @IBOutlet weak var descImage: UIImageView!
    @IBOutlet weak var descTitle: UILabel!
    @IBOutlet weak var descContent: UILabel!
    
    var food: Food? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let safeFood = food {
            
//            self.title = safeFood.name
            self.descTitle.text = safeFood.name
            self.descContent.text = safeFood.content
            
            if let url = URL(string: safeFood.imgFood), let imgData = try? Data(contentsOf: url) {
                let uiImageData = UIImage(data: imgData)
                descImage.image = uiImageData
            }
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
}
