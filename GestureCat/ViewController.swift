

import UIKit

class ViewController: UIViewController {

    let image = UIImage(named: "fish")
    lazy var imageView = UIImageView(image: image)
    lazy var imageViewSecond = UIImageView(image: image)
    lazy var imageViewThird = UIImageView(image: image)
    
    let Ice = UIImage(named: "ice")
    lazy var imageViewIce = UIImageView(image: Ice)
    lazy var imageViewIceThird = UIImageView(image: Ice)
    
    let imageSausage = UIImage(named: "sausage")
    lazy var imageSausageFirst = UIImageView(image: imageSausage)
    lazy var imagSausageSecond = UIImageView(image: imageSausage)
    
    var isGaming = true
    var Gaming = true
    var GamingSausage = true
    
    @IBOutlet weak var catView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 30, y: -100, width: 50, height: 50)
        view.addSubview(imageViewSecond)
        imageViewSecond.frame = CGRect(x: 150, y: -150, width: 50, height: 50)
        view.addSubview(imageViewThird)
        imageViewThird.frame = CGRect(x: 300, y: -150, width: 50, height: 50)
        
        view.addSubview(imageViewIce)
        imageViewIce.frame = CGRect(x: 30, y: -150, width: 100, height: 100)
        view.addSubview(imageViewIceThird)
        imageViewIceThird.frame = CGRect(x: 270, y: -80, width: 100, height: 100)
        
        view.addSubview(imageSausageFirst)
        imageSausageFirst.frame = CGRect(x: 80, y: -150, width: 60, height: 60)
        view.addSubview(imagSausageSecond)
        imagSausageSecond.frame = CGRect(x: 300, y: -60, width: 60, height: 60)
        
        
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
            } else if catView.center.x > self.view.frame.size.width + 20 {
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
        _ = self.view.center.x - self.catView.center.x
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 4, delay: 4, options: [
            .curveLinear, .repeat], animations: {
                self.imageView.frame.origin.y +=
                self.view.frame.width + 900
            })
        
        UIView.animate(withDuration: 3, delay: 5, options: [
            .curveLinear, .repeat], animations: {
                self.imageViewSecond.frame.origin.y +=
                self.view.frame.width + 600
            })
        
        UIView.animate(withDuration: 8, delay: 2, options: [
            .curveLinear, .repeat], animations: {
                self.imageViewThird.frame.origin.y +=
                self.view.frame.width + 900
            })
        
        UIView.animate(withDuration: 6, delay: 10, options: [
            .curveLinear, .repeat], animations: {
                self.imageViewIce.frame.origin.y +=
                self.view.frame.width + 400
            })
        
        UIView.animate(withDuration: 8, delay: 3, options: [
            .curveLinear, .repeat], animations: {
                self.imageViewIceThird.frame.origin.y +=
                self.view.frame.width + 400
            })
        
        UIView.animate(withDuration: 5, delay: 3, options: [
            .curveLinear, .repeat], animations: {
                self.imageSausageFirst.frame.origin.y +=
                self.view.frame.width + 800
            })
        
        UIView.animate(withDuration: 5, delay: 8, options: [
            .curveLinear, .repeat], animations: {
                self.imagSausageSecond.frame.origin.y +=
                self.view.frame.width + 400
            })
        
        intersects()
        intersectsFirstFish()
        intersectsSecondFish()
        intersectsThirdFish()
        intersectsSausageFirst()
        intersectsSausageSecond()
        
    }

    func intersects() {
        guard isGaming else { return }
        if checkIntersect(catView, imageViewIce)
            || checkIntersect(catView, imageViewIceThird) {
            print("GAME OVER")
            imageViewIce.layer.removeAllAnimations()
            imageViewIceThird.layer.removeAllAnimations()
            print("GAME STOPPED")
            isGaming = false
            
            let alert = UIAlertController(title: "GAME OVER", message: "попробуй еще раз 🙊", preferredStyle: .alert)
            let ViewBack = storyboard?.instantiateViewController(withIdentifier: "transition")
            let okButton = UIAlertAction(title: "OK", style: .default, handler: {_ in self.navigationController?.pushViewController(ViewBack!, animated: true)
            })
            
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: nil)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.intersects()
        }
     
    }
    
    func checkIntersect(_ first: UIView, _ second: UIView) -> Bool {
        guard let firstFrame = first.layer.presentation()?.frame,
              let secondFrame = second.layer.presentation()?.frame else { return true }
        
        return firstFrame.intersects(secondFrame)
        }
    
    
    func intersectsFirstFish() {
        guard Gaming else { return }
        if checkIntersect(catView, imageView){
            print("fish")
            imageView.layer.removeAllAnimations()
            Gaming = true
            imageView.frame = CGRect(x: 30, y: -100, width: 50, height: 50)
            UIView.animate(withDuration: 6, delay: 4, options: [
                .curveLinear, .repeat], animations: {
                    self.imageView.frame.origin.y +=
                    self.view.frame.width + 800
                })
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.intersectsFirstFish()
        }
        
    }
   
    func intersectsSecondFish() {
        guard Gaming else { return }
        if checkIntersect(catView, imageViewSecond){
            print("fish")
            imageViewSecond.layer.removeAllAnimations()
            Gaming = true
            imageViewSecond.frame = CGRect(x: 150, y: -150, width: 50, height: 50)
            UIView.animate(withDuration: 3, delay: 5, options: [
                .curveLinear, .repeat], animations: {
                    self.imageViewSecond.frame.origin.y +=
                    self.view.frame.width + 600
                })
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.intersectsSecondFish()
        }
        
    }
    
    func intersectsThirdFish() {
        guard Gaming else { return }
        if checkIntersect(catView, imageViewThird){
            print("fish")
            imageViewThird.layer.removeAllAnimations()
            Gaming = true
            imageViewThird.frame = CGRect(x: 300, y: -150, width: 50, height: 50)
            UIView.animate(withDuration: 8, delay: 2, options: [
                .curveLinear, .repeat], animations: {
                    self.imageViewThird.frame.origin.y +=
                    self.view.frame.width + 900
                })
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.intersectsThirdFish()
        }
        
    }
    
    func intersectsSausageFirst() {
        guard Gaming else { return }
        if checkIntersect(catView, imageSausageFirst){
            print("fish")
            imageSausageFirst.layer.removeAllAnimations()
            Gaming = true
            imageSausageFirst.frame = CGRect(x: 80, y: -150, width: 60, height: 60)
            UIView.animate(withDuration: 5, delay: 3, options: [
                .curveLinear, .repeat], animations: {
                    self.imageSausageFirst.frame.origin.y +=
                    self.view.frame.width + 800
                })
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.intersectsSausageFirst()
        }
        
    }
    
    func intersectsSausageSecond() {
        guard Gaming else { return }
        if checkIntersect(catView, imagSausageSecond){
            print("fish")
            imagSausageSecond.layer.removeAllAnimations()
            GamingSausage = true
            imagSausageSecond.frame = CGRect(x: 300, y: -60, width: 60, height: 60)
            UIView.animate(withDuration: 5, delay: 8, options: [
                .curveLinear, .repeat], animations: {
                    self.imagSausageSecond.frame.origin.y +=
                    self.view.frame.width + 400
                })
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.intersectsSausageSecond()
        }

    }

    
}

