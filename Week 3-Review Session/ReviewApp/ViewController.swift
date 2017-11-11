//
//  ViewController.swift
//  ReviewApp
//
//  Created by Shridhar Sukhani on 28/10/17.
//  Copyright © 2017 Shridhar Sukhani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var sliderValue: Int = 50
    var targetVal: Int = Int(arc4random_uniform(100))
    
    @IBOutlet weak var targetValue: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        targetValue.text = String(targetVal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func sliderMoved(_ sender: UISlider) {
        sliderValue = lroundf(sender.value)
    }
    
    @IBAction func showAlert(_ sender: UIButton) {
        
        let pointsScored: Int = 100 - abs(targetVal - sliderValue)
        
        let alert = UIAlertController(title: "Points",
                                      message: "You scored \(pointsScored)!",
            preferredStyle: .alert)
        let action = UIAlertAction(title: "Yayay!",
                                   style: .default,
                                   handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
        targetVal = Int(arc4random_uniform(100))
        targetValue.text = String(targetVal)
        
    }
    
}

