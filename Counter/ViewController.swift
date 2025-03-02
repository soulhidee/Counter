//
//  ViewController.swift
//  Counter
//
//  Created by Даниил on 01.03.2025.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var counterLabel: UILabel!
    
    @IBOutlet weak var mainButton: UIButton!
    var counter: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func buttonTouchUp(_ sender: Any) {
        counter += 1
        counterLabel.text = "\(counter)"
    }
    
}

