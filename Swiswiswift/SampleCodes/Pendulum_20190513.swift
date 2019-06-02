
import UIKit
import CoreMotion

class PendulumView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setPendulum(rad: Double) {

        layer.sublayers?.removeAll()

        let width = frame.width / 2
        let origin = CGPoint(x: width, y: 0)

        let x = Double(width) * sin(rad) + Double(origin.x)
        let y = Double(width) * cos(rad) + Double(origin.y)

        let path = UIBezierPath()
        path.move(to: origin)
        path.addLine(to: CGPoint(x: x, y: y))
        path.close()

        let shapeLayer = CAShapeLayer()
        shapeLayer.lineWidth = 7
        shapeLayer.lineCap = CAShapeLayerLineCap.round
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.path = path.cgPath
        layer.addSublayer(shapeLayer)
    }
}

class Pendulum_20190513: UIViewController {

    let motionManager = CMMotionManager()
    var pendulumView: PendulumView!
    var degreeLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        let width = view.frame.width
        let height = view.frame.height

        pendulumView = PendulumView()
        pendulumView.frame = CGRect(x: 0, y: height * 0.25, width: width, height: width / 2)
        pendulumView.backgroundColor = .lightGray
        view.addSubview(pendulumView)
        
        degreeLabel = UILabel()
        degreeLabel.frame = CGRect(x: 0, y: 60, width: width, height: 60)
        degreeLabel.textAlignment = .center
        view.addSubview(degreeLabel)

        // accelerometer
        if motionManager.isAccelerometerAvailable {
            // set interval
            motionManager.accelerometerUpdateInterval = 0.4

            // start accelerometer
            motionManager.startAccelerometerUpdates(
                to: OperationQueue.current!,
                withHandler: { (accelData: CMAccelerometerData?, errorOC: Error?) in
                    self.outputAccelData(acceleration: accelData!.acceleration)
                }
            )
        }
    }

    func outputAccelData(acceleration: CMAcceleration) {
        let rad = atan(acceleration.x / acceleration.y)
        pendulumView.setPendulum(rad: -rad)
        
        let degree = rad * 180 / Double.pi
        degreeLabel.text = String(degree) + "°"
    }

    // stop accelerometer
    func stopAccelerometer() {
        if (motionManager.isAccelerometerActive) {
            motionManager.stopAccelerometerUpdates()
        }
    }
}
