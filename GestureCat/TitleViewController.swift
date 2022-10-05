//
//  TitleViewController.swift
//  GestureCat
//
//  Created by  aleksandr on 3.10.22.
//

import UIKit

class TitleViewController: UIViewController {
    
    @IBOutlet weak var StartTitle: UIView!
        
    
        override func viewDidLoad() {
        super.viewDidLoad()

        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.systemGray6.cgColor,UIColor.green.cgColor]
        gradient.frame = StartTitle.bounds
        StartTitle.layer.insertSublayer(gradient, at: 0)
        StartTitle.layer.cornerRadius = 50
        StartTitle.layer.masksToBounds = true
        StartTitle.layer.borderWidth = 2
    
        let gradientView = CAGradientLayer()
        gradientView.colors = [UIColor.yellow.cgColor,UIColor.systemPink.cgColor]
        gradientView.frame = view.bounds
        view.layer.insertSublayer(gradientView, at: 0)
        view.layer.masksToBounds = true
        

        
    }

}
