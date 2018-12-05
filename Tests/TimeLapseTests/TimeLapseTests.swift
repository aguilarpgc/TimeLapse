import XCTest
@testable import TimeLapse

final class TimeLapseTests: XCTestCase {
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
//        XCTAssertEqual(TimeLapse().text, "Hello, World!")
    }
    
    func testJustNow() {
        XCTAssertEqual(0.shortTimeLapse(), "just now")
        XCTAssertEqual(2.shortTimeLapse(), "just now")
        XCTAssertEqual(9.shortTimeLapse(), "just now")
    }
    
    // Seconds
    func testSeconds() {
        XCTAssertEqual(10.shortTimeLapse(), "10s")
        XCTAssertEqual(20.shortTimeLapse(), "20s")
        XCTAssertEqual(59.shortTimeLapse(), "59s")
    }
    
    // Minutes
    func testMinutes() {
        XCTAssertEqual(60.shortTimeLapse(), "1m")
        XCTAssertEqual(1800.shortTimeLapse(), "30m")
        XCTAssertEqual(3599.shortTimeLapse(), "59m")
    }
    
    // Hours
    func testHours() {
        XCTAssertEqual(3600.shortTimeLapse(), "1h")
        XCTAssertEqual(7200.shortTimeLapse(), "2h")
        XCTAssertEqual(43200.shortTimeLapse(), "12h")
        XCTAssertEqual(86399.shortTimeLapse(), "23h")
    }
    
    // Days
    func testDays() {
        XCTAssertEqual(86_400.shortTimeLapse(),"1d")
        XCTAssertEqual(172_799.shortTimeLapse(),"1d")
        XCTAssertEqual(172_800.shortTimeLapse(),"2d")
        XCTAssertEqual(360_000.shortTimeLapse(),"4d")
        XCTAssertEqual(604_799.shortTimeLapse(),"6d")
    }
    
    // Weeks
    func testWeeks() {
        XCTAssertEqual(604_800.shortTimeLapse(), "1w")
        XCTAssertEqual(2_591_999.shortTimeLapse(), "4w")
    }
    
    // Months
    func testMonths() {
        XCTAssertEqual(2_592_000.shortTimeLapse(), "1mo")
        XCTAssertEqual(5_184_000.shortTimeLapse(), "2mo")
        XCTAssertEqual(15_552_000.shortTimeLapse(), "6mo")
        XCTAssertEqual(31_535_999.shortTimeLapse(), "12mo")
    }
    
    // Years
    func testYears() {
        XCTAssertEqual(31_536_000.shortTimeLapse(), "1y")
        XCTAssertEqual(63_072_000.shortTimeLapse(), "2y")
        XCTAssertEqual(630_720_000.shortTimeLapse(), "20y")
    }
    
    // Custom
    func testCustom() {
        
        struct CustomTimeLapseFormat: TimeLapseFormat {
            
            var now: String = "now"
            var second: String = "sec"
            var minute: String = "min"
            var hour: String = "hour"
            var day: String = "d"
            var week: String = "w"
            var month: String = "mon"
            var year: String = "y"
        }
        
        TimeLapse.format = CustomTimeLapseFormat()
        
        XCTAssertEqual(0.shortTimeLapse(), "now")
        XCTAssertEqual(10.shortTimeLapse(), "10sec")
        XCTAssertEqual(1800.shortTimeLapse(), "30min")
        XCTAssertEqual(7200.shortTimeLapse(), "2hour")
        XCTAssertEqual(604_799.shortTimeLapse(), "6d")
        XCTAssertEqual(2_591_999.shortTimeLapse(), "4w")
        XCTAssertEqual(31_535_999.shortTimeLapse(), "12mon")
        XCTAssertEqual(630_720_000.shortTimeLapse(), "20y")
        
        TimeLapse.setDefaultTimeLapseFormat()
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
