import UIKit

struct Sample {
    var title: String
    var date: String
    var className: String
}

let samples: [Sample] = [
    Sample(title: "UISlider RoundValue", date: "2019/05/22", className: NSStringFromClass(UISliderRoundValue_20190523.self)),
    Sample(title: "UISlider Sample", date: "2019/05/22", className: NSStringFromClass(UISlider_20190522.self)),
    Sample(title: "Pendulum Sample", date: "2019/05/13", className: NSStringFromClass(Pendulum_20190513.self)),
    Sample(title: "Accelerometer Sample", date: "2019/05/12", className: NSStringFromClass(Accelerometer_20190512.self)),
    Sample(title: "UITests Sample", date: "2019/04/01", className: NSStringFromClass(UITestSample_20190404.self))
]
