

import UIKit

class ViewController: UIViewController {

    // MARK: - Private properties
    
    private let image = UIImage(named: "fish")
    private lazy var imageView = UIImageView(image: image)
    private lazy var imageViewSecond = UIImageView(image: image)
    private lazy var imageViewThird = UIImageView(image: image)
    
    let Ice = UIImage(named: "ice")
    lazy var imageViewIce = UIImageView(image: Ice)
    lazy var imageViewIceThird = UIImageView(image: Ice)
    
    let imageSausage = UIImage(named: "sausage")
    lazy var imageSausageFirst = UIImageView(image: imageSausage)
    lazy var imagSausageSecond = UIImageView(image: imageSausage)
    
    lazy var catX: CGFloat = view.frame.width / 2
    lazy var catY: CGFloat = view.frame.height * 2 / 3
    
    var isGaming = true
    
    var timer = Timer()
    var time = 3 {
        didSet {
            timerLabel.text = "\(time)"
        }
    }
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var catView: UIImageView!
    
    @IBOutlet weak var ScoreLebel: UILabel!
    
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var RezultLebel: UILabel!
    
    var Score = 0
    
    var Rezult = 0
    
    let visualEffectView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .dark)
        let view = UIVisualEffectView(effect: blurEffect)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Override methods
    
    override func viewDidLayoutSubviews() {
        catView.center = CGPoint(x: catX, y: catY)
    }
    
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
        
        catView.isUserInteractionEnabled = true
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(dragTheView))
        catView.addGestureRecognizer(panGestureRecognizer)
        
        catView.layer.shadowOffset = CGSize(width: 5, height: 5)
        catView.layer.shadowOpacity = 0.5
        catView.layer.shadowRadius = 2
        
       
        timer = Timer.scheduledTimer(timeInterval: 1.1, target: self, selector: #selector(tick), userInfo: nil, repeats: true)
    }
   
    @objc func tick() {
        time -= 1
        if time == 0 {
            timer.invalidate()
            timerLabel.text = nil
        }
    }
   
    @objc func dragTheView(recognizer: UIPanGestureRecognizer) {
        
        if recognizer.state == .began {
            //
        } else if recognizer.state == .changed {
            
            let translation = recognizer.translation(in: self.view)
            tiltTheView(with: translation)
            
            let newX = catView.center.x + translation.x
            let newY = catView.center.y + translation.y
            
            catView.center = CGPoint(x: newX, y: newY)
            catX = newX
            catY = newY
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
    
    // MARK: - Private methods
    
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
                self.view.frame.width + 600
            })
        
        UIView.animate(withDuration: 8, delay: 3, options: [
            .curveLinear, .repeat], animations: {
                self.imageViewIceThird.frame.origin.y +=
                self.view.frame.width + 800
            })
        
        UIView.animate(withDuration: 5, delay: 3, options: [
            .curveLinear, .repeat], animations: {
                self.imageSausageFirst.frame.origin.y +=
                self.view.frame.width + 800
            })
        
        UIView.animate(withDuration: 12, delay: 8, options: [
            .curveLinear, .repeat], animations: {
                self.imagSausageSecond.frame.origin.y +=
                self.view.frame.width + 700
            })
        
        intersects()
        intersectsFirstFish()
        intersectsSecondFish()
        intersectsThirdFish()
        intersectsSausageFirst()
        intersectsSausageSecond()
        
        setupVisualEffectView()
        
        RezultLebel.text = String(Rezult)
        ScoreLebel.text = String(Score)
        let RezultDefault = UserDefaults.standard
        
                                    //  СОХРАНЕНИНЕ РЕЗУЛЬТАТА ИГРЫ ПЕЕРЕД ВЫХОДОМ
        
        if (RezultDefault.value(forKey: "Rezult") != nil){
            Rezult = (RezultDefault.value(forKey: "Rezult") as! Int?)!
            RezultLebel.text = String(format: "", Rezult)
            ScoreLebel.text = String(format: "0", Score)
            if (Score > Rezult) {
                Rezult = Score
                RezultLebel.text = String(format: "Rezult", Rezult)
                
                let RezultDefault = UserDefaults.standard
                RezultDefault.setValue(Rezult, forKey: "Rezult")
                RezultDefault.synchronize()
            }
        }
    }
    
    func intersects() {
        guard isGaming else { return }
        if checkIntersect(catView, imageViewIce)
            || checkIntersect(catView, imageViewIceThird) {
            print("GAME OVER")
            animateIn()
            imageViewIce.layer.removeAllAnimations()
            imageViewIceThird.layer.removeAllAnimations()
            imageView.layer.removeAllAnimations()
            imageViewSecond.layer.removeAllAnimations()
            imageViewThird.layer.removeAllAnimations()
            imageSausageFirst.layer.removeAllAnimations()
            imagSausageSecond.layer.removeAllAnimations()
            isGaming = false

            let alert = UIAlertController(title: "GAME OVER", message: "попробуй еще раз 🙊", preferredStyle: .alert)
            guard let viewBack = storyboard?.instantiateViewController(withIdentifier: "transition") else { return }
            let okButton = UIAlertAction(title: "OK", style: .default, handler: { [self]_ in self.navigationController?.pushViewController(viewBack, animated: true)
            })
            
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: nil)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.intersects()
            
        }
    }
    
    func intersectsFirstFish() {
        guard isGaming else { return }
        if checkIntersect(catView, imageView){
            print("fish")
            isGaming = true
            
            self.Score += 1
            self.ScoreLebel.text = String(self.Score)
            
            RezultLebel.text = String(Rezult)
            
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
        guard isGaming else { return }
        if checkIntersect(catView, imageViewSecond){
            print("fish")
            isGaming = true
            
            Score += 1
            ScoreLebel.text = String(Score)
        
            RezultLebel.text = String(Rezult)

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
        guard isGaming else { return }
        if checkIntersect(catView, imageViewThird){
            print("fish")
            isGaming = true
            
            Score += 1
            ScoreLebel.text = String(Score)
            
            RezultLebel.text = String(Rezult)
            
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
        guard isGaming else { return }
        if checkIntersect(catView, imageSausageFirst){
            print("fish")
            isGaming = true
            
            Score += 1
            ScoreLebel.text = String(Score)
            
            RezultLebel.text = String(Rezult)
            
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
        guard isGaming else { return }
        if checkIntersect(catView, imagSausageSecond){
            print("fish")
            isGaming = true
            
            Score += 1
            ScoreLebel.text = String(Score)
            
            RezultLebel.text = String(Rezult)
            
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
   
    func checkIntersect(_ first: UIView, _ second: UIView) -> Bool {
        guard let firstFrame = first.layer.presentation()?.frame,
              let secondFrame = second.layer.presentation()?.frame else { return true }
        
        return firstFrame.intersects(secondFrame)
        }
    
    func setupVisualEffectView() {
        view.addSubview(visualEffectView)
        visualEffectView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        visualEffectView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        visualEffectView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        visualEffectView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        visualEffectView.alpha = 0
    }
    
    func animateIn() {
        UIView.animate(withDuration: 2) {
            self.visualEffectView.alpha = 1
            
        }
    }
   
}

