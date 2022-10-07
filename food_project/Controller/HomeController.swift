//
//  HomeController.swift
//  food_project
//
//  Created by Luca Chaboissier on 30/09/2022.
//

import Foundation
import UIKit
import QuartzCore

class HomeController: UIViewController {

    @IBOutlet weak var scrollViewWithCorner: UIScrollView!
    
    @IBOutlet weak var logoWithCorner: UIImageView!
    @IBOutlet weak var image1WithCorner: UIView!
    
    @IBOutlet weak var image2WithCorner: UIView!
    @IBOutlet weak var sectionListviewWithCorner: UIView!
    @IBOutlet weak var sectionRandomWithCorner: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let homeView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        homeView.roundCornerView(corners: [.allCorners], radius: 8)
        self.view.addSubview(homeView)
        
        self.logoWithCorner.layer.cornerRadius = 5
        self.logoWithCorner.layer.masksToBounds = true
        
        self.scrollViewWithCorner.layer.cornerRadius = 5
        self.scrollViewWithCorner.layer.masksToBounds = true
        
        self.image1WithCorner.layer.cornerRadius = 5
        self.image1WithCorner.layer.masksToBounds = true
        
        self.image2WithCorner.layer.cornerRadius = 5
        self.image2WithCorner.layer.masksToBounds = true
        
        self.sectionListviewWithCorner.layer.cornerRadius = 5
        self.sectionListviewWithCorner.layer.masksToBounds = true
        
        self.sectionRandomWithCorner.layer.cornerRadius = 5
        self.sectionRandomWithCorner.layer.masksToBounds = true
        
    }
    
    @IBAction func homeButton1(_ sender: Any) {
        let storyboard = self.storyboard?.instantiateViewController(withIdentifier: "ListviewController") as! ListviewController
        self.navigationController?.pushViewController(storyboard, animated: true)
    }
    
}

extension UIView{
    func roundCornerView(corners: UIRectCorner, radius: CGFloat){
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: .init(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
}
