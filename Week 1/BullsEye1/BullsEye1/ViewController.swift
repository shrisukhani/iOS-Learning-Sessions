//
//  ViewController.swift
//  BullsEye1
//
//  Created by Shridhar Sukhani on 14/10/17.
//  Copyright © 2017 Shridhar Sukhani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showAlert(_ sender: UIButton) {
        let alert = UIAlertController(title: "Hello World",
                                      message: "This is my first App",
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: "Awesome",
                                   style: .default,
                                   handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
}

