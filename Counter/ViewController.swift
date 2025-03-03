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
extension String {
    var historyTextViewInfo: String {
        return "История изменений:\n\(self)"
    }
}


class ViewController: UIViewController {
    @IBOutlet weak var historyTextView: UITextView!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var counterLabel: UILabel!
    
    
    let dateString = DateFormatter.localizedString(from: Date(), dateStyle: .short, timeStyle: .medium)

    private var counter: Int = 0 {
        didSet {
            updateCounterLabel()
        }
    }
    
    private var history: String = "" {
        
        didSet {
            updatehistoryTextView()
        }
    }
    
    private func updateCounterLabel() {
        counterLabel.text = counter.counterInfo
    }
    
    
    private func updatehistoryTextView() {
        historyTextView.text = history.historyTextViewInfo
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateCounterLabel()
        updatehistoryTextView()
    }

    
    @IBAction func plusButtonTouchUp(_ sender: Any) {
        counter += 1
        historyTextView.text += "значение изменено на +1"
        
    }
    @IBAction func minusButtonTouchUp(_ sender: Any) {
        if counter > 0 {
            counter -= 1
            historyTextView.text += "\nзначение изменено на -1"
        } else {
            historyTextView.text += "\nпопытка уменьшить значение счётчика ниже 0"
        }
        
    }
    @IBAction func resetButtonTouchUp(_ sender: Any) {
        counter = 0
        historyTextView.text += "\nзначение сброшено"
    }
    
}



