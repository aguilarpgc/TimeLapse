# TimeLapse

[![Swift](https://img.shields.io/badge/swift-4.2-orange.svg?style=flat)](https://swift.org/)
[![License](https://img.shields.io/badge/license-MIT-71787A.svg)](https://tldrlegal.com/license/mit-license)
[![Platform](https://img.shields.io/badge/platform-ios%20%7C%20macos%20%7C%20tvos%20%7C%20watchos-lightgrey.svg)](https://developer.apple.com/swift/)

`Date` extension that compares `Date` with current time, converts it in seconds and returns a formatted time lapse description `String`.

## Installation

### Swift Package Manager

```
dependencies: [
    .package(url: "https://github.com/aguilarpgc/TimeLapse.git", from: "0.4.0")
]
```

## Usage

### Default

#### Date

``` Swift
let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "dd/MM/yyyy HH:mm:ss"

let fakeCurrentDate = dateFormatter.date(from: "24/12/2018 23:59:59")!

let date0  = dateFormatter.date(from: "24/12/2018 23:59:58")!
let date1  = dateFormatter.date(from: "24/12/2018 23:59:09")!
let date2  = dateFormatter.date(from: "24/12/2018 23:52:59")!
let date3  = dateFormatter.date(from: "24/12/2018 18:59:59")!
let date4  = dateFormatter.date(from: "23/12/2018 23:59:59")!
let date5  = dateFormatter.date(from: "09/12/2018 23:59:59")!
let date6  = dateFormatter.date(from: "24/11/2018 23:59:59")!
let date7  = dateFormatter.date(from: "24/12/2016 23:59:59")!
```

* Now :   `date0.elapsedTime(from: fakeCurrentDate)` **just now**
* Seconds :   `date1.elapsedTime(from: fakeCurrentDate)` **50s**
* Minutes :   `date2.elapsedTime(from: fakeCurrentDate)` **7min**
* Hours  :  `date3.elapsedTime(from: fakeCurrentDate)` **5h**
* Days  :  `date4.elapsedTime(from: fakeCurrentDate)` **1d**
* Weeks  :  `date5.elapsedTime(from: fakeCurrentDate)` **2w**
* Months  :  `date6.elapsedTime(from: fakeCurrentDate)` **1mo**
* Years  :  `date7.elapsedTime(from: fakeCurrentDate)` **2y**

#### Int (Seconds)

* Now :  `2.shortTimeLapse()`  **just now**
* Seconds :  `10.shortTimeLapse()`   **10s**
* Minutes :  `1800.shortTimeLapse()`   **30min**
* Hours  :  `43200.shortTimeLapse()`   **12h**
* Days  :  `172_800.shortTimeLapse()`    **2d**
* Weeks  :  `604_800.shortTimeLapse()`   **1w**
* Months  :  `15_552_000.shortTimeLapse()`   **6mo**
* Years  :  `31_536_000.shortTimeLapse()`   **1y**

### Custom

Conforts to the protocol `TimeLapseFormat` and assign it to `TimeLapse.format`

#### Example

``` Swift
struct CustomTimeLapseFormat: TimeLapseFormat {

    var now    : String = "now"
    var second : String = "sec"
    var minute : String = "m"
    var hour   : String = "hour"
    var day    : String = "d"
    var week   : String = "w"
    var month  : String = "mon"
    var year   : String = "y"

}
```
##### Then:

``` Swift
TimeLapse.format = CustomTimeLapseFormat()
```

##### Result: 

* Now: `0.shortTimeLapse()` **now**
* Seconds: `10.shortTimeLapse()` **10sec**
* Minutes: `1800.shortTimeLapse()` **30m**
* Hours: `7200.shortTimeLapse()` **2hour**
* Days: `604_799.shortTimeLapse()` **6d**
* Weeks: `2_591_999.shortTimeLapse()` **4w**
* Months: `31_535_999.shortTimeLapse()` **12mon**
* Years: `630_720_000.shortTimeLapse()` **20y**

##### Change back to default format

``` Swift
TimeLapse.enableDefaultFormat()
```
