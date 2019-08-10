import UIKit

class BarcodeScannerFirst_20190809: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let button = UIButton()
        button.setTitle("Tap Me!!", for: .normal)
        button.backgroundColor = .lightGray
        button.frame.size = CGSize(width: 200, height: 200)
        button.center = view.center
        button.addTarget(self, action: #selector(showBarcodeScanner), for: .touchUpInside)
        view.addSubview(button)
    }
    
    @objc func showBarcodeScanner() {
        let barcodeScanner = BarcodeScannerSecond_20190809()
        present(barcodeScanner, animated: true)
    }
}
