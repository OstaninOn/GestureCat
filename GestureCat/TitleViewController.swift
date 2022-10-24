//
//  TitleViewController.swift
//  GestureCat
//
//  Created by  aleksandr on 3.10.22.
//

import UIKit

class TitleViewController: UIViewController {
    
    @IBOutlet weak var StartTitle: UIView!
        
    @IBOutlet weak var BackgroundImage: BackgroundImageView!
    
    @IBOutlet weak var catDinaic: UIImageView!
    
        var animator: UIDynamicAnimator!
        var gravity: UIGravityBehavior!
        var collision: UICollisionBehavior!
    
        override func viewDidLoad() {
        super.viewDidLoad()
            
        BackgroundImage.makeBlur()

        let gradient = CAGradientLayer()
            gradient.colors = [UIColor.systemGray6.cgColor,UIColor.green.cgColor,]
        gradient.frame = StartTitle.bounds
        StartTitle.layer.insertSublayer(gradient, at: 0)
        StartTitle.layer.cornerRadius = 75
        StartTitle.layer.masksToBounds = true
        StartTitle.layer.borderWidth = 1

        let gradientView = CAGradientLayer()
            gradientView.colors = [UIColor.black.cgColor,UIColor.systemPink.cgColor]
        gradientView.frame = view.bounds
        view.layer.insertSublayer(gradientView, at: 0)
        view.layer.masksToBounds = false
        
                    
        animator = UIDynamicAnimator(referenceView: view)
        gravity = UIGravityBehavior(items: [catDinaic,])
        animator.addBehavior(gravity)
        
        collision = UICollisionBehavior(items: [catDinaic,StartTitle])
        collision.addBoundary(withIdentifier: "StartTitle" as NSCopying, for: UIBezierPath(rect: StartTitle.frame))
        collision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collision)

          
        let itemBehaviour = UIDynamicItemBehavior(items: [catDinaic,StartTitle])
            itemBehaviour.elasticity = 1
        animator.addBehavior(itemBehaviour)
            
          
    }

}
