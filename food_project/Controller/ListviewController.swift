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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Liste des plats"
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
}

extension ListviewController: UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    //MARK: Datasource

    
    func searchBar()
    {
        let searchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 50))
        searchBar.delegate = self
        searchBar.showsScopeBar = true
        searchBar.tintColor = UIColor.lightGray
        self.tableView.tableHeaderView = searchBar
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListviewController.cellIdentifier, for: indexPath)
        
        cell.textLabel?.text = "\(foods[indexPath.row].name)"
        cell.detailTextLabel?.text = "\(foods[indexPath.row].tags)"
        
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
