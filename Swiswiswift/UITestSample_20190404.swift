import UIKit

class UITestSample_20190404: UIViewController {

    var leftValueTextField: UITextField!
    var rightValueTextField: UITextField!
    var resultButton: UIButton!
    var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let width = view.frame.width
        
        leftValueTextField = UITextField()
        leftValueTextField.accessibilityIdentifier = "leftValueTextField"
        leftValueTextField.frame = CGRect(x: width * 0.05, y: 200, width: width * 0.4, height: 60)
        leftValueTextField.layer.borderWidth = 1
        leftValueTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        leftValueTextField.textAlignment = .center
        leftValueTextField.keyboardType = .numberPad
        view.addSubview(leftValueTextField)

        rightValueTextField = UITextField()
        rightValueTextField.accessibilityIdentifier = "rightValueTextField"
        rightValueTextField.frame = CGRect(x: width * 0.55, y: 200, width: width * 0.4, height: 60)
        rightValueTextField.layer.borderWidth = 1
        rightValueTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        rightValueTextField.textAlignment = .center
        rightValueTextField.keyboardType = .numberPad
        view.addSubview(rightValueTextField)
        
        resultButton = UIButton()
        resultButton.accessibilityIdentifier = "resultButton"
        resultButton.frame = CGRect(x: width * 0.2, y: 300, width: width * 0.6, height: 60)
        resultButton.setTitle("=", for: .normal)
        resultButton.setTitleColor(.black, for: .normal)
        resultButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 38)
        resultButton.isEnabled = false
        resultButton.layer.borderWidth = 1
        resultButton.addTarget(self, action: #selector(resultButtonOnTap), for: .touchDown)
        view.addSubview(resultButton)
        
        resultLabel = UILabel()
        resultLabel.accessibilityIdentifier = "resultLabel"
        resultLabel.frame = CGRect(x: width * 0.2, y: 400, width: width * 0.6, height: 60)
        resultLabel.textAlignment = .center
        view.addSubview(resultLabel)
    }
    
    @objc func textFieldDidChange() {
        guard let leftText = leftValueTextField.text, let rightText = rightValueTextField.text else {
            return
        }
        setResultButtonStatus(leftText: leftText, rightText: rightText)
    }
    
    @objc func resultButtonOnTap() {
        guard let leftText = leftValueTextField.text,  let rightText = rightValueTextField.text else {
            return
        }
        
        guard let leftNumber = Float(leftText), let rightNumber = Float(rightText) else {
            return
        }
        setResultLabel(leftNumber: leftNumber, rightNumber: rightNumber)
    }

    func setResultButtonStatus(leftText: String, rightText: String) {
        if leftText.isEmpty || rightText.isEmpty {
            resultButton.isEnabled = false
        } else {
            resultButton.isEnabled = true
        }
    }
    
    func setResultLabel(leftNumber: Float, rightNumber: Float) {
        resultLabel.text = String(format: "%.1f", leftNumber * rightNumber)
    }
}

