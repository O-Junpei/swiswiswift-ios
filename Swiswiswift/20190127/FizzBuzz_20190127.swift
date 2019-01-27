import UIKit

class FizzBuzz_20190127 {

    class func fizzBuzz(num: Int) -> String {
        if num % 15 == 0 {
            return "FizzBuzz"
        } else if num % 3 == 0 {
            return "Fizz"
        } else if num % 5 == 0 {
            return "Buzz"
        } else {
            return "\(num)"
        }
    }
}
