import XCTest

@testable import Swiswiswift

class FizzBuzzTests_20190127: XCTestCase {

    func testTreeMultiples() {
        for treeMultiples in [3, 6, 9, 12, 18] {
            let actual = FizzBuzz_20190127.fizzBuzz(num: treeMultiples)
            XCTAssertEqual(actual, "Fizz")
        }
    }

    func testFiveMultiples() {
        for fiveMultiples in [5, 10, 20, 25, 50] {
            let actual = FizzBuzz_20190127.fizzBuzz(num: fiveMultiples)
            XCTAssertEqual(actual, "Buzz")
        }
    }

    func testThreeAndFiveMultiples() {
        for testThreeAndFiveMultiples in [15, 30, 45, 60, 75] {
            let actual = FizzBuzz_20190127.fizzBuzz(num: testThreeAndFiveMultiples)
            XCTAssertEqual(actual, "FizzBuzz")
        }
    }
}
