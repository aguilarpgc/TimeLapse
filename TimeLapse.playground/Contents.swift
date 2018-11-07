import XCTest

class TimeLapseTests: XCTestCase {
    
    // Just now
    func testJustNow() {
        XCTAssertEqual(0.timeLapseFormat(), "ahora")
        XCTAssertEqual(2.timeLapseFormat(), "ahora")
        XCTAssertEqual(9.timeLapseFormat(), "ahora")
    }
    
    // Seconds
    func testSeconds() {
        XCTAssertEqual(10.timeLapseFormat(), "10 seg")
        XCTAssertEqual(20.timeLapseFormat(), "20 seg")
        XCTAssertEqual(59.timeLapseFormat(), "59 seg")
    }
    
    // Minutes
    func testMinutes() {
        XCTAssertEqual(60.timeLapseFormat(), "1 min")
        XCTAssertEqual(1800.timeLapseFormat(), "30 min")
        XCTAssertEqual(3599.timeLapseFormat(), "59 min")
    }
    
    // Hours
    func testHours() {
        XCTAssertEqual(3600.timeLapseFormat(), "1 hr")
        XCTAssertEqual(7200.timeLapseFormat(), "2 hrs")
        XCTAssertEqual(43200.timeLapseFormat(), "12 hrs")
        XCTAssertEqual(86399.timeLapseFormat(), "23 hrs")
    }
    
    // Days
    func testDays() {
        XCTAssertEqual(86_400.timeLapseFormat(),"1 día")
        XCTAssertEqual(172_799.timeLapseFormat(),"1 día")
        XCTAssertEqual(172_800.timeLapseFormat(),"2 días")
        XCTAssertEqual(360_000.timeLapseFormat(),"4 días")
        XCTAssertEqual(604_799.timeLapseFormat(),"6 días")
    }
    
    // Weeks
    func testWeeks() {
        XCTAssertEqual(604_800.timeLapseFormat(), "1 sem")
        XCTAssertEqual(2_591_999.timeLapseFormat(), "4 sem")
    }
    
    // Months
    func testMonths() {
        XCTAssertEqual(2_592_000.timeLapseFormat(), "1 mes")
        XCTAssertEqual(5_184_000.timeLapseFormat(), "2 meses")
        XCTAssertEqual(15_552_000.timeLapseFormat(), "6 meses")
        XCTAssertEqual(31_535_999.timeLapseFormat(), "12 meses")
    }
    
    func testYears() {
        XCTAssertEqual(31_536_000.timeLapseFormat(), "1 año")
        XCTAssertEqual(63_072_000.timeLapseFormat(), "2 años")
        XCTAssertEqual(630_720_000.timeLapseFormat(), "20 años")
    }
}

TimeLapseTests.defaultTestSuite.run()
