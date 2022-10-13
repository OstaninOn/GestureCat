

import UIKit

class ViewController: UIViewController {
    

    let image = UIImage(named: "fish")
    lazy var imageView = UIImageView(image: image)
    lazy var imageViewSecond = UIImageView(image: image)
    lazy var imageViewThird = UIImageView(image: image)

    @IBOutlet weak var catView: UIView!
    

    override func viewDidLoad() {
        super.viewDidLoad()


        view.addSubview(imageView)
        imageView.frame = CGRect(x: 50, y: -200, width: 50, height: 50)
        
        view.addSubview(imageViewSecond)
        imageViewSecond.frame = CGRect(x: 150, y: -150, width: 50, height: 50)
        
        view.addSubview(imageViewThird)
        imageViewThird.frame = CGRect(x: 250, y: -150, width: 50, height: 50)
    
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
  
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 4, delay: 4, options: [
            .curveLinear, .repeat], animations: {
                self.imageView.frame.origin.y +=
                self.view.frame.width + 500
            })
        
        UIView.animate(withDuration: 3, delay: 5, options: [
            .curveLinear, .repeat], animations: {
                self.imageViewSecond.frame.origin.y +=
                self.view.frame.width + 500
            })
        
        UIView.animate(withDuration: 5, delay: 2, options: [
            .curveLinear, .repeat], animations: {
                self.imageViewThird.frame.origin.y +=
                self.view.frame.width + 500
            })
        
    }
   
    
    
}

