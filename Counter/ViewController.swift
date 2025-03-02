//
//  ViewController.swift
//  Counter
//
//  Created by Даниил on 01.03.2025.
//

import UIKit
extension Int {
    var counterInfo: String {
        return "Значение счётчика:\n\(self)"
    }
}

class ViewController: UIViewController {
    @IBOutlet weak var historyTextView: UITextView!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var counterLabel: UILabel!
    
    private var counter: Int = 0 {
        didSet {
            updateCounterLabel()
        }
    }
    private func updateCounterLabel() {
            counterLabel.text = counter.counterInfo //
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateCounterLabel()
    }

    
    @IBAction func plusButtonTouchUp(_ sender: Any) {
        counter += 1
        
    }
    @IBAction func minusButtonTouchUp(_ sender: Any) {
        counter -= 1
        if counter < 0 {
            counter = 0
        }

    }
    @IBAction func resetButtonTouchUp(_ sender: Any) {
        counter = 0
    }
    
}


