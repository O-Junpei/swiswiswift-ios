import UIKit
import CoreMotion

class GyroMeterViewController_20190602: UIViewController {

    let motionManager = CMMotionManager()
    
    var gyroX: UILabel!
    var gyroY: UILabel!
    var gyroZ: UILabel!
    var angle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let width = view.frame.width
        let height = view.frame.height
        
        // labels
        gyroX = UILabel()
        gyroX.textAlignment = .center
        gyroX.frame = CGRect(x: width * 0.1, y: height * 0.2, width: width * 0.8, height: height * 0.1)
        view.addSubview(gyroX)
        
        gyroY = UILabel()
        gyroY.textAlignment = .center
        gyroY.frame = CGRect(x: width * 0.1, y: height * 0.4, width: width * 0.8, height: height * 0.1)
        view.addSubview(gyroY)
        
        angle = UILabel()
        angle.textAlignment = .center
        angle.frame = CGRect(x: width * 0.1, y: height * 0.8, width: width * 0.8, height: height * 0.1)
        view.addSubview(angle)
        
        gyroZ = UILabel()
        gyroZ.textAlignment = .center
        gyroZ.frame = CGRect(x: width * 0.1, y: height * 0.6, width: width * 0.8, height: height * 0.1)
        view.addSubview(gyroZ)
        
        // gyro sensor
        if motionManager.isGyroAvailable {
            // set interval
            motionManager.gyroUpdateInterval = 0.4
            
            // start gyro sensor
            motionManager.startGyroUpdates(to: OperationQueue.current!) { (gyroData, error) in
                self.outputAccelData(rotationRate: gyroData!.rotationRate)
            }
        } else {
            print("Gyro is not available")
        }
    }
    
    func outputAccelData(rotationRate: CMRotationRate){
        gyroX.text = "x=" + String(format: "%06f", rotationRate.x)
        gyroY.text = "y=" + String(format: "%06f", rotationRate.y)
        gyroZ.text = "z=" + String(format: "%06f", rotationRate.z)
    }
}
