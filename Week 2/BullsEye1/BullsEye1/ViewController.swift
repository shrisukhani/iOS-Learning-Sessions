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
    var roundNum: Int = 1
    
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        targetValue = Int(arc4random_uniform(100))
        targetLabel.text = String(targetValue)
        roundLabel.text = String(roundNum)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func sliderMoved(_ sender: UISlider) {
        currentValue = lroundf(sender.value)
    }
    
    @IBAction func showAlert(_ sender: UIButton) {
        
        let pointsEarned: Int = 100 - abs(targetValue - currentValue)
        
        let alert = UIAlertController(title: "Points Earned!",
                                      message: "You earned \(pointsEarned) points in this round!",
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: "Yay!",
                                   style: .default,
                                   handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
        targetValue = Int(arc4random_uniform(100))
        targetLabel.text = String(targetValue)
        
        roundNum += 1
        roundLabel.text = String(roundNum)
        
    }
    
}

