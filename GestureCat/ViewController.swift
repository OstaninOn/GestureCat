//
//  ViewController.swift
//  GestureCat
//
//  Created by  aleksandr on 3.10.22.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var catView: UIView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(dragTheView))
        catView.addGestureRecognizer(panGestureRecognizer)
    }
    @objc func dragTheView(recognizer: UIPanGestureRecognizer) {
        
        if recognizer.state == .began {
        } else if recognizer.state == .changed {
            
            let translation = recognizer.translation(in: self.view)
            tiltTheView(with: translation)
            
            let newX = catView.center.x + translation.x
            let newY = catView.center.y + translation.y
            
            catView.center = CGPoint(x: newX, y: newY)
            recognizer.setTranslation(CGPoint.zero, in: self.view)
            
        } else if recognizer.state == .ended {
          
            if catView.center.x < 20 {
                UIView.animate(withDuration: 0.6, animations: { [unowned self] in
                    self.catView.center.x = -self.catView.frame.size.width
                })
            } else if catView.center.x > self.view.frame.size.width - 20 {
                UIView.animate(withDuration: 0.6, animations: { [unowned self] in
                    self.catView.center.x = self.view.frame.size.width + self.catView.frame.size.width
                })
            }
            
            UIView.animate(withDuration: 0.6, delay: 0, animations: {
                self.catView.transform = .identity
                self.catView.center = self.view.center
            })
            
        }
      
    }
    
    
    private func tiltTheView(with translationValue: CGPoint) {
        let translationMoved = self.view.center.x - self.catView.center.x
        let divKoef = (self.view.frame.size.width / 1) / 1
        
        catView.transform = CGAffineTransform(rotationAngle: translationMoved / divKoef)
    }
}

