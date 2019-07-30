import UIKit

struct Sample {
    var title: String
    var date: String
    var className: String
}

let samples: [Sample] = [
    Sample(title: "TableView Height", date: "2019/07/30", className: NSStringFromClass(TableViewHeight_20190730.self)),
    Sample(title: "UIButton", date: "2019/06/04", className: NSStringFromClass(UIButton_20190604.self)),
    Sample(title: "Attitude Meter", date: "2019/06/05", className: NSStringFromClass(AttitudeMeterViewController_20190603.self)),
    Sample(title: "Gyro Meter", date: "2019/06/02", className: NSStringFromClass(GyroMeterViewController_20190602.self)),
    Sample(title: "UISlider RoundValue", date: "2019/05/22", className: NSStringFromClass(UISliderRoundValue_20190523.self)),
    Sample(title: "UISlider Sample", date: "2019/05/22", className: NSStringFromClass(UISlider_20190522.self)),
    Sample(title: "Pendulum Sample", date: "2019/05/13", className: NSStringFromClass(Pendulum_20190513.self)),
    Sample(title: "Accelerometer Sample", date: "2019/05/12", className: NSStringFromClass(Accelerometer_20190512.self)),
    Sample(title: "UITests Sample", date: "2019/04/01", className: NSStringFromClass(UITestSample_20190404.self))
]
