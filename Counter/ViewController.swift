import UIKit

// MARK: - Extensions

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

// MARK: - ViewController

final class ViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet weak private var historyTextView: UITextView!
    @IBOutlet weak private var resetButton: UIButton!
    @IBOutlet weak private var minusButton: UIButton!
    @IBOutlet weak private var plusButton: UIButton!
    @IBOutlet weak private var counterLabel: UILabel!

    // MARK: - Constants

    private let counterKey = "counterValue"
    private let historyKey = "historyLog"

    // MARK: - Properties

    private var counter: Int = 0 {
        didSet {
            updateCounterLabel()
            UserDefaults.standard.set(counter, forKey: counterKey)
        }
    }

    private var historyLog: String = "" {
        didSet {
            updateHistoryTextView()
            UserDefaults.standard.set(historyLog, forKey: historyKey)
        }
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        loadSavedData()
        setupTextView()
        updateCounterLabel()
        updateHistoryTextView()
    }

    // MARK: - Setup

    private func setupTextView() {
        historyTextView.isEditable = false
        historyTextView.isScrollEnabled = true
    }

    // MARK: - UI Updates

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

    // MARK: - Persistence

    private func loadSavedData() {
        let savedCounter = UserDefaults.standard.integer(forKey: counterKey)
        let savedHistory = UserDefaults.standard.string(forKey: historyKey) ?? ""
        counter = savedCounter
        historyLog = savedHistory
    }

    // MARK: - Logic

    private func addHistoryEntry(_ message: String) {
        let dateString = DateFormatter.localizedString(from: Date(), dateStyle: .short, timeStyle: .medium)
        historyLog += "[\(dateString)]: \(message)\n"
    }

    // MARK: - Actions

    @IBAction private func plusButtonTouchUp(_ sender: Any) {
        counter += 1
        addHistoryEntry("значение изменено на +1")
    }

    @IBAction private func minusButtonTouchUp(_ sender: Any) {
        if counter > 0 {
            counter -= 1
            addHistoryEntry("значение изменено на -1")
        } else {
            addHistoryEntry("попытка уменьшить значение счётчика ниже 0")
        }
    }

    @IBAction private func resetButtonTouchUp(_ sender: Any) {
        counter = 0
        addHistoryEntry("значение сброшено")
    }
}
