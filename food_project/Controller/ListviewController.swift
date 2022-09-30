//
//  ListviewController.swift
//  food_project
//
//  Created by Luca Chaboissier on 30/09/2022.
//

import UIKit
import Alamofire
import SwiftyJSON

class ListviewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    //MARK: - Variables
    var foods: [Food] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Liste des burgers*"
        refreshFoodList()
        
        print("coucou")
    }
    
    //MARK: - Custom Functions
    func refreshFoodList() {
        self.foods.removeAll()
        FoodApi.getFoods().done { foodsResponse in
            self.foods = foodsResponse
            self.tableView.reloadData()
        }
    }
    
    

//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        self.performSegue(withIdentifier: "segueToBeerDescription", sender: beers[indexPath.row])
//    }
        
    //MARK: - Segue
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "segueToBeerDescription" {
//
//            let food = sender as? Food
//
//            if let viewControllerDestination = segue.destination as? BeerDescriptionViewController {
//                viewControllerDestination.beer = beer
//            }
//
//        }
//    }
}

extension ListviewController: UITableViewDelegate, UITableViewDataSource {
    //MARK: Datasource

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        
        cell.textLabel?.text = "\(foods[indexPath.row].name)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foods.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    

}
