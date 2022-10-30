//
//  ScoreViewController.swift
//  GestureCat
//
//  Created by  aleksandr on 27.10.22.
//

import UIKit



class ScrolViewController: UIViewController {
    
    private lazy var firstScoreName = "TROLL 3000"
    private lazy var secondScoreName = "Vitalik"
    private lazy var thirdScoreName = "Kotik"
    
    private lazy var firstScore = 100500
    private lazy var secondScore = 1337
    private lazy var thirdScore = 228
    
    
    @IBOutlet weak var firstScoreLabel: UILabel!
    
    @IBOutlet weak var secondScoreLabel: UILabel!
    
    @IBOutlet weak var thirdScoreLabel: UILabel!
    
    
    
    @IBOutlet weak var firstNameLabel: UILabel!
    
    @IBOutlet weak var secondNameLabel: UILabel!
    
    @IBOutlet weak var thirdNameLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    private func updateScores() {
        
        let storage = UserDefaults.standard
        
        firstScoreName = storage.string(forKey: "firstScoreName") ?? ""
        secondScoreName = storage.string(forKey: "secondScoreName") ?? ""
        thirdScoreName = storage.string(forKey: "thirdScoreName") ?? ""
        
        firstScore = storage.integer(forKey: "firstScore")
        secondScore = storage.integer(forKey: "secondScore")
        thirdScore = storage.integer(forKey: "thirdScore")
        
        
        firstNameLabel.text = firstScoreName.makeName()
        secondNameLabel.text = secondScoreName.makeName()
        thirdNameLabel.text = thirdScoreName.makeName()
        
        firstScoreLabel.text = firstScore.makeScore()
        secondScoreLabel.text = secondScore.makeScore()
        thirdScoreLabel.text = thirdScore.makeScore()
        
        
    }
    
    @IBAction func resetScores(_ sender: Any) {
        //
        //        let storage = UserDefaults.standard
        //
        //
        //            storage.set("", forKey: "firstScoreName")
        //            storage.set("", forKey: "secondScoreName")
        //            storage.set("", forKey: "thirdScoreName")
        //
        //            storage.set(0, forKey: "firstScore")
        //            storage.set(0, forKey: "secondScore")
        //            storage.set(0, forKey: "thirdScore")
        //
        //            updateScores()
        //
           }
    }
    
