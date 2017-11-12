//
//  ViewController.swift
//  BullsEye1
//
//  Created by Shridhar Sukhani on 14/10/17.
//  Copyright © 2017 Shridhar Sukhani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue: Int = 50
    var targetValue: Int = 0
    var roundNum: Int = 0
    var totalScore: Int = 0
    
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        startNewRound()
        updateLabels()
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")!
        slider.setThumbImage(thumbImageNormal, for: .normal)
        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")!
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        let trackLeftImage = UIImage(named: "SliderTrackLeft")!
        let trackLeftResizable =
            trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        let trackRightImage = UIImage(named: "SliderTrackRight")!
        let trackRightResizable =
            trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
    }
    
    func startNewRound() {
        roundNum += 1
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue) //Setting slider back to 50.
    }
    
    func updateLabels() {
        targetLabel.text = "\(targetValue)" //Alternative: String(targetValue)
        roundLabel.text = "\(roundNum)"
        scoreLabel.text = String(totalScore)
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func sliderMoved(_ sender: UISlider) {
        currentValue = lroundf(sender.value)
    }
    
    @IBAction func startNewGame(_ sender: UIButton) {
        totalScore = 0
        roundNum = 0
        startNewRound()
        updateLabels()
    }
    
    
    @IBAction func showAlert(_ sender: UIButton) {
        
        let pointsEarned: Int = 100 - abs(targetValue - currentValue)
        totalScore += pointsEarned
        
        let alert = UIAlertController(title: "Points Earned!",
                                      message: "You earned \(pointsEarned) points in this round!",
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: "Yay!",
                                   style: .default,
                                   handler: {action in
                                    self.startNewRound()
                                    self.updateLabels()
        })
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
}

