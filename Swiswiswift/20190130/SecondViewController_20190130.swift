import UIKit

class SecondViewController_20190130: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .lightGray
        let button = UIButton()
        button.frame.size = CGSize(width: 200, height: 100)
        button.center = view.center
        button.backgroundColor = .orange
        button.setTitle("Switch To First", for: .normal)
        button.addTarget(self, action: #selector(switchToFirst(sender:)), for:.touchUpInside)
        view.addSubview(button)
    }
    
    @objc func switchToFirst(sender: UIButton) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.switchFirst()
    }
}
