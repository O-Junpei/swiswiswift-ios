import UIKit
import CoreMotion

class AttitudeMeterViewController_20190603: UIViewController {

    let motionManager = CMMotionManager()
    
    var rollLabel: UILabel!
    var pitchLabel: UILabel!
    var yawLabel: UILabel!
    var angle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let width = view.frame.width
        let height = view.frame.height
        
        // labels
        rollLabel = UILabel()
        rollLabel.textAlignment = .center
        rollLabel.frame = CGRect(x: width * 0.1, y: height * 0.2, width: width * 0.8, height: height * 0.1)
        view.addSubview(rollLabel)
        
        pitchLabel = UILabel()
        pitchLabel.textAlignment = .center
        pitchLabel.frame = CGRect(x: width * 0.1, y: height * 0.4, width: width * 0.8, height: height * 0.1)
        view.addSubview(pitchLabel)
        
        angle = UILabel()
        angle.textAlignment = .center
        angle.frame = CGRect(x: width * 0.1, y: height * 0.8, width: width * 0.8, height: height * 0.1)
        view.addSubview(angle)
        
        yawLabel = UILabel()
        yawLabel.textAlignment = .center
        yawLabel.frame = CGRect(x: width * 0.1, y: height * 0.6, width: width * 0.8, height: height * 0.1)
        view.addSubview(yawLabel)
        
        if motionManager.isDeviceMotionAvailable {
            // set interval
            motionManager.deviceMotionUpdateInterval = 0.4
            
            // start
            motionManager.startDeviceMotionUpdates(to: .main) { (motionData, error) in
                self.outputAccelData(attitude: motionData!.attitude)
            }
        } else {
            print("DeviceMotion is not available")
        }
    }
    
    func outputAccelData(attitude: CMAttitude){
        rollLabel.text = "roll=" + String(format: "%06f", attitude.roll * 180 / Double.pi)
        pitchLabel.text = "pitch=" + String(format: "%06f", attitude.pitch * 180 / Double.pi)
        yawLabel.text = "yaw=" + String(format: "%06f", attitude.yaw * 180 / Double.pi)
    }
}
