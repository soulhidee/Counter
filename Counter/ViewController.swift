//
//  ViewController.swift
//  Counter
//
//  Created by Даниил on 01.03.2025.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var counterLabel: UILabel!
    
    private var counter: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        counterLabel.text = "Значение счётчика:\n\(counter)"
    }

    
    @IBAction func plusButtonTouchUp(_ sender: Any) {
        counter += 1
        counterLabel.text = "Значение счётчика:\n\(counter)"
    }
    @IBAction func minusButtonTouchUp(_ sender: Any) {
        counter -= 1
        if counter < 0 {
            counter = 0
        }
        counterLabel.text = "Значение счётчика:\n\(counter)"
    }
    @IBAction func resetButtonTouchUp(_ sender: Any) {
        counter = 0
        counterLabel.text = "Значение счётчика:\n\(counter)"
    }
    
}

