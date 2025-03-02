//
//  ViewController.swift
//  Counter
//
//  Created by Даниил on 01.03.2025.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var mainButton: UIButton!
    
    private var counter: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        counterLabel.text = "Значение счётчика:\n\(counter)"
    }

    @IBAction func mainButtonTouchUp(_ sender: Any) {
        counter += 1
        counterLabel.text = "Значение счётчика:\n\(counter)"
    }
    
}

