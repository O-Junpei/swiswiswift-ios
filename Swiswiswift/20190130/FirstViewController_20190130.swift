import UIKit

class FirstViewController_20190130: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .orange
        let button = UIButton()
        button.frame.size = CGSize(width: 200, height: 100)
        button.center = view.center
        print(button.frame)
        button.backgroundColor = .lightGray
        button.setTitle("Switch To Second", for: .normal)
        button.addTarget(self, action: #selector(switchToSecond(sender:)), for:.touchUpInside)
        view.addSubview(button)
    }
    
    @objc func switchToSecond(sender: UIButton) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.switchViewController(viewController: SecondViewController_20190130())
    }
}
