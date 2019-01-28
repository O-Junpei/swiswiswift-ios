import UIKit

class SecondViewController_20190121: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "SecondView"
        view.backgroundColor = UIColor.blue
        
        let width = view.frame.width
        let height = view.frame.height
        
        let transitionBtn = UIButton()
        transitionBtn.frame.size = CGSize(width: width * 0.6, height: height * 0.2)
        transitionBtn.center = view.center
        transitionBtn.backgroundColor = UIColor.green
        transitionBtn.setTitle("Back To FirstVC", for: UIControl.State.normal)
        transitionBtn.setTitleColor(UIColor.black, for: UIControl.State.normal)
        transitionBtn.addTarget(self, action: #selector(backToFirstVC(sender:)), for:.touchUpInside)
        view.addSubview(transitionBtn)
    }
    
    @objc internal func backToFirstVC(sender: UIButton){
        // back to previous ViewController
        navigationController?.popViewController(animated: true)
        
        // Back to Root ViewController
        // navigationController?.popToRootViewController(animated: true)
    }
}
