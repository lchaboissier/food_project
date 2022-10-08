//
//  RandomFoodController.swift
//  food_project
//
//  Created by Luca Chaboissier on 07/10/2022.
//

import Foundation
import UIKit

class RandomFoodController: UIViewController {

    
    @IBOutlet weak var randomTitle: UILabel!
    @IBOutlet weak var randomContent: UITextView!
    @IBOutlet weak var randomImage: UIImageView!
    
    //MARK: Variables
    var foods: [Food] = []
    var secondsRemaining = 2.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        FoodApi.getFoods().done(on: .main, {response in
            self.foods = response
        })
    }
    
    @IBAction func randomize(_ sender: Any) {
        self.secondsRemaining = 2.0
        randomize()
    }
    
    //MARK: Functions
    
    func randomize() {
        
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (Timer) in
                if self.secondsRemaining > 0 {
                    let food = self.getRandomfood()
                    self.randomTitle.text = food.name
                    self.randomContent.text = food.content
                    if let url = URL(string: food.imgFood), let imgData = try? Data(contentsOf: url) {
                        let image = UIImage(data: imgData)
                        self.randomImage.image = image
                    }
                    self.secondsRemaining -= 0.1
                } else {
                    Timer.invalidate()
                }
            }
    }
    
    func getRandomfood() -> Food {
        let randomIndex = Int.random(in: 0...(self.foods.count - 1))
        return self.foods[randomIndex]
    }
}
