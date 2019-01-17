import XCTest
@testable import TimeLapse

final class TimeLapseTests: XCTestCase {
    
    func testDates() {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm:ss"
        
        let fakeCurrentDate = dateFormatter.date(from: "24/12/2018 23:59:59")!
        
        let date0  = dateFormatter.date(from: "24/12/2018 23:59:58")!
        let date1  = dateFormatter.date(from: "24/12/2018 23:59:09")!
        let date2  = dateFormatter.date(from: "24/12/2018 23:58:59")!
        let date3  = dateFormatter.date(from: "24/12/2018 23:52:59")!
        let date4  = dateFormatter.date(from: "24/12/2018 18:59:59")!
        let date5  = dateFormatter.date(from: "23/12/2018 23:59:59")!
        let date6  = dateFormatter.date(from: "09/12/2018 23:59:59")!
        let date7  = dateFormatter.date(from: "24/11/2018 23:59:59")!
        let date8  = dateFormatter.date(from: "24/01/2018 23:59:59")!
        let date9 = dateFormatter.date(from: "24/12/2016 23:59:59")!
        
        XCTAssertEqual(date0.elapsedTime(from: fakeCurrentDate), "just now")
        XCTAssertEqual(date1.elapsedTime(from: fakeCurrentDate), "50s")
        XCTAssertEqual(date2.elapsedTime(from: fakeCurrentDate), "1min")
        XCTAssertEqual(date3.elapsedTime(from: fakeCurrentDate), "7min")
        XCTAssertEqual(date4.elapsedTime(from: fakeCurrentDate), "5h")
        XCTAssertEqual(date5.elapsedTime(from: fakeCurrentDate), "1d")
        XCTAssertEqual(date6.elapsedTime(from: fakeCurrentDate), "2w")
        XCTAssertEqual(date7.elapsedTime(from: fakeCurrentDate), "1mo")
        XCTAssertEqual(date8.elapsedTime(from: fakeCurrentDate), "11mo")
        XCTAssertEqual(date9.elapsedTime(from: fakeCurrentDate), "2y")
    }

    func testJustNow() {
        XCTAssertEqual((-10).shortTimeLapse(), "just now") // Invalid -> "just now"
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
        XCTAssertEqual(60.shortTimeLapse(), "1min")
        XCTAssertEqual(1800.shortTimeLapse(), "30min")
        XCTAssertEqual(3599.shortTimeLapse(), "59min")
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
            
            var now    : String = "now"
            var second : String = "sec"
            var minute : String = "m"
            var hour   : String = "hr"
            var day    : String = "d"
            var week   : String = "w"
            var month  : String = "mon"
            var year   : String = "y"
        }
        
        TimeLapse.format = CustomTimeLapseFormat()
        
        XCTAssertEqual(0.shortTimeLapse(), "now")
        XCTAssertEqual(10.shortTimeLapse(), "10sec")
        XCTAssertEqual(1800.shortTimeLapse(), "30m")
        XCTAssertEqual(7200.shortTimeLapse(), "2hr")
        XCTAssertEqual(604_799.shortTimeLapse(), "6d")
        XCTAssertEqual(2_591_999.shortTimeLapse(), "4w")
        XCTAssertEqual(31_535_999.shortTimeLapse(), "12mon")
        XCTAssertEqual(630_720_000.shortTimeLapse(), "20y")
        
        TimeLapse.setDefaultFormat()
    }
    
    static var allTests = [
        ("testJustNow", testJustNow),
        ("testSeconds", testSeconds),
        ("testMinutes", testMinutes),
        ("testHours", testHours),
        ("testDays", testDays),
        ("testWeeks", testWeeks),
        ("testMonths", testMonths),
        ("testYears", testYears),
        ("testCustom", testCustom)]
}

