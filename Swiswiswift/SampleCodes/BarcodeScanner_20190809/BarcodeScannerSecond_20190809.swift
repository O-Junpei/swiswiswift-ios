import UIKit
import AVFoundation

class BarcodeScannerSecond_20190809: UIViewController, AVCaptureMetadataOutputObjectsDelegate {

    // create objects to manage camera and microphone input
    private let session = AVCaptureSession()

    override func viewDidLoad() {
        super.viewDidLoad()

        // create objects to manage camera and microphone devices
        let discoverySession = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInWideAngleCamera], mediaType: .video, position: .back)

        // get device instance
        let devices = discoverySession.devices

        // use the first acquired device
        guard let rearCamera = devices.first else {
            print("camera not found")
            return
        }

        do {
            // use the rear camera video to read the QR code
            let deviceInput = try AVCaptureDeviceInput(device: rearCamera)
            guard session.canAddInput(deviceInput) else {
                return
            }
            session.addInput(deviceInput)

            // detect QR code from rear camera video
            let metadataOutput = AVCaptureMetadataOutput()
            guard session.canAddOutput(metadataOutput) else {
                return
            }
            self.session.addOutput(metadataOutput)
            metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)

            // set the type of barcode to be detect
            // .ean13 is a barcode used for books, etc.
            // .qr is a QR code, etc.
            metadataOutput.metadataObjectTypes = [.ean13]

            // set the scan detectable area
            // think of your iPhone lying down
            let x: CGFloat = 0.1
            let y: CGFloat = 0.4
            let width: CGFloat = 0.8
            let height: CGFloat = 0.2
            metadataOutput.rectOfInterest = CGRect(x: y, y: 1 - x - width, width: height, height: width)

            // create layer to display the rear camera video on the screen
            let previewLayer = AVCaptureVideoPreviewLayer(session: self.session)
            previewLayer.frame = view.bounds
            previewLayer.videoGravity = .resizeAspectFill
            view.layer.addSublayer(previewLayer)

            // add red frame
            let detectionArea = UIView()
            detectionArea.frame = CGRect(x: view.frame.size.width * x, y: view.frame.size.height * y, width: view.frame.size.width * width, height: view.frame.size.height * height)
            detectionArea.layer.borderColor = UIColor.red.cgColor
            detectionArea.layer.borderWidth = 3
            view.addSubview(detectionArea)

            // detect start
            session.startRunning()
        } catch {
            print("Error occured while creating video device input: \(error)")
        }

        // close button
        let closeButton = UIButton()
        closeButton.frame = CGRect(x: 40, y: 60, width: 100, height: 40)
        closeButton.setTitle("Close", for: UIControl.State.normal)
        closeButton.backgroundColor = UIColor.lightGray
        closeButton.addTarget(self, action: #selector(closeTaped(sender:)), for: .touchUpInside)
        view.addSubview(closeButton)
    }

    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        guard let metadatas = metadataObjects as? [AVMetadataMachineReadableCodeObject] else {
            return
        }

        for metadata in metadatas {
            // check barcode is empty
            guard let value = metadata.stringValue else {
                continue
            }
            
            // barcode type, value
            print(metadata.type)
            print(value)

            // show alert
            let alert = UIAlertController(title: "バーコードの中身", message: metadata.stringValue, preferredStyle: UIAlertController.Style.alert)
            let cancel = UIAlertAction(title: "Close", style: UIAlertAction.Style.cancel, handler: nil)
            alert.addAction(cancel)
            present(alert, animated: true, completion: nil)
        }
    }

    // close
    @objc func closeTaped(sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
