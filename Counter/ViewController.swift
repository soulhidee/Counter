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

final class ViewController: UIViewController {
    @IBOutlet weak private var historyTextView: UITextView!
    @IBOutlet weak private var resetButton: UIButton!
    @IBOutlet weak private var minusButton: UIButton!
    @IBOutlet weak private var plusButton: UIButton!
    @IBOutlet weak private var counterLabel: UILabel!
    
    private var counter: Int = 0 {
        didSet {
            updateCounterLabel()
        }
    }
    
    private var historyLog: String = "" {
        didSet {
            updateHistoryTextView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateCounterLabel()
        updateHistoryTextView()
        historyTextView.isEditable = false
        historyTextView.isScrollEnabled = true
        scrollTextViewToBottom()
    }
    
    private func updateCounterLabel() {
        counterLabel.text = counter.counterInfo
    }
    
    private func updateHistoryTextView() {
        historyTextView.text = historyLog.historyTextViewInfo
        scrollTextViewToBottom()
    }
    
    private func scrollTextViewToBottom() {
           let range = NSRange(location: historyTextView.text.count - 1, length: 1)
           historyTextView.scrollRangeToVisible(range)
       }
    
    private func addHistoryEntry(_ message: String) {
           let dateString = DateFormatter.localizedString(from: Date(), dateStyle: .short, timeStyle: .medium)
           historyLog += "[\(dateString)]: \(message)\n"
       }
    
    @IBAction private func plusButtonTouchUp(_ sender: Any) {
        counter += 1
        addHistoryEntry("значение изменено на +1")
    }
    
    @IBAction private func minusButtonTouchUp(_ sender: Any) {
        if counter > 0 {
            counter -= 1
            addHistoryEntry("значение изменено на -1")
        } else {
            addHistoryEntry ("попытка уменьшить значение счётчика ниже 0")
        }
    }
    
    @IBAction private func resetButtonTouchUp(_ sender: Any) {
        counter = 0
        addHistoryEntry("значение сброшено")
    }
}



