import UIKit
import CoreMotion

// refarence: https://i-app-tec.com/ios/accelerometer.html
class Accelerometer_20190512: UIViewController {
    
    let motionManager = CMMotionManager()
    
    var accelerometerX: UILabel!
    var accelerometerY: UILabel!
    var accelerometerZ: UILabel!
    var angle: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let width = view.frame.width
        let height = view.frame.height
        
        // labels
        accelerometerX = UILabel()
        accelerometerX.textAlignment = .center
        accelerometerX.frame = CGRect(x: width * 0.1, y: height * 0.2, width: width * 0.8, height: height * 0.1)
        view.addSubview(accelerometerX)
        
        accelerometerY = UILabel()
        accelerometerY.textAlignment = .center
        accelerometerY.frame = CGRect(x: width * 0.1, y: height * 0.4, width: width * 0.8, height: height * 0.1)
        view.addSubview(accelerometerY)
        
        angle = UILabel()
        angle.textAlignment = .center
        angle.frame = CGRect(x: width * 0.1, y: height * 0.8, width: width * 0.8, height: height * 0.1)
        view.addSubview(angle)
        
        accelerometerZ = UILabel()
        accelerometerZ.textAlignment = .center
        accelerometerZ.frame = CGRect(x: width * 0.1, y: height * 0.6, width: width * 0.8, height: height * 0.1)
        view.addSubview(accelerometerZ)
        
        // accelerometer
        if motionManager.isAccelerometerAvailable {
            // set interval
            motionManager.accelerometerUpdateInterval = 0.4
            
            // start accelerometer
            motionManager.startAccelerometerUpdates(
                to: OperationQueue.current!,
                withHandler: {(accelData: CMAccelerometerData?, errorOC: Error?) in
                    self.outputAccelData(acceleration: accelData!.acceleration)
            })
            
        }
    }
    
    func outputAccelData(acceleration: CMAcceleration){
        accelerometerX.text = "x=" + String(format: "%06f", acceleration.x)
        accelerometerY.text = "y=" + String(format: "%06f", acceleration.y)
        accelerometerZ.text = "z=" + String(format: "%06f", acceleration.z)
        angle.text = "angle" + String(atan(acceleration.x /  acceleration.y) * 180 / Double.pi) + "°"
    }
    
    // stop accelerometer
    func stopAccelerometer(){
        if (motionManager.isAccelerometerActive) {
            motionManager.stopAccelerometerUpdates()
        }
    }
}
