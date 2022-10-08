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
    static var cellIdentifier = "cell"
    var wordToFound = "404"
    var filteredData: [Food]?
    @IBOutlet weak var searchBar: UISearchBar!
    var searchWord = ""//ça à ajouter
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Liste des plats"
        refreshFoodList()
        print("coucou")
        searchBar.delegate = self
    }
    
    //MARK: - Custom Functions
    func refreshFoodList() {
        self.foods.removeAll()
        FoodApi.getFoods(tag: searchWord).done { foodsResponse in
            self.foods = foodsResponse
            self.tableView.reloadData()
        }
    }
}

extension ListviewController: UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    //MARK: Datasource
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        if searchText == "" {
            filteredData = self.foods
        } else {
            for food in self.foods {
                if food.name.lowercased().contains(searchText.lowercased()) {
                    filteredData?.append(food)
                }
                
            }
        }
            searchWord = searchText
            wordToFound = self.searchWord
            refreshFoodList()
            self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = "\(foods[indexPath.row].name)"
        cell.detailTextLabel?.text = "\(foods[indexPath.row].tags)"
        
//        cell.imageView?.image = UIImage(named: "\(foods[indexPath.row].imgFood)")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foods.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.performSegue(withIdentifier: "segueToFoodDescription", sender: foods[indexPath.row])
    }
    
    //MARK: - Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToFoodDescription" {
            
            let food = sender as? Food
            
            if let viewControllerDestination = segue.destination as? DescriptionviewController {
                viewControllerDestination.food = food
            }
        }
    }
}
