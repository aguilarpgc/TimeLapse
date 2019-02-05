# TimeLapse

[![Swift](https://img.shields.io/badge/swift-4.2-orange.svg?style=flat)](https://swift.org/)
[![License](https://img.shields.io/badge/license-MIT-71787A.svg)](https://tldrlegal.com/license/mit-license)
[![Platform](https://img.shields.io/badge/platform-ios%20%7C%20macos%20%7C%20tvos%20%7C%20watchos-lightgrey.svg)](https://developer.apple.com/swift/)

`Date` extension that compares `Date` with current time, converts it in seconds and returns a formatted time lapse description `String`.

## Installation

### Swift Package Manager

```
dependencies: [
    .package(url: "https://github.com/aguilarpgc/TimeLapse.git", from: "0.5.0")
]
```

## Usage

### Default

``` Swift
import Foundation
import TimeLapse

let currentDate = Date()
let pastDate = Calendar.current.date(byAdding: .second, value: -700, to: currentDate)!

let timeLapse = pastDate.elapsedTime(until: currentDate)

print(timeLapse) // 11min
```

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

date0.elapsedTime(until: fakeCurrentDate) // Now
date1.elapsedTime(until: fakeCurrentDate) // Seconds
date2.elapsedTime(until: fakeCurrentDate) // Minutes
date3.elapsedTime(until: fakeCurrentDate) // Hours
date4.elapsedTime(until: fakeCurrentDate) // Days
date5.elapsedTime(until: fakeCurrentDate) // Weeks
date6.elapsedTime(until: fakeCurrentDate) // Months
date7.elapsedTime(until: fakeCurrentDate) // Years
```

* Now     : **just now**
* Seconds : **50s**
* Minutes : **7min**
* Hours   : **5h**
* Days    : **1d**
* Weeks   : **2w**
* Months  : **1mo**
* Years   : **2y**

#### Int (Seconds)

```
2.shortTimeLapse() // Now
10.shortTimeLapse() // Seconds
1800.shortTimeLapse() // Minutes
43200.shortTimeLapse() // Hours
172_800.shortTimeLapse() // Days
604_800.shortTimeLapse() // Weeks
15_552_000.shortTimeLapse() // Months
31_536_000.shortTimeLapse() // Years
```
* Now     : **just now**
* Seconds : **10s**
* Minutes : **30min**
* Hours   : **12h**
* Days    : ***2d**
* Weeks   : **1w**
* Months  : **6mo**
* Years   : **1y**

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

```
0.shortTimeLapse()` // Now
10.shortTimeLapse()` // Seconds
1800.shortTimeLapse()` // Minutes
7200.shortTimeLapse()` // Hours
604_799.shortTimeLapse()` // Days
2_591_999.shortTimeLapse()` // Weeks
31_535_999.shortTimeLapse()` // Months
630_720_000.shortTimeLapse()` // Years
```

* Now     : **now**
* Seconds : **10sec**
* Minutes : **30m**
* Hours   : **2hour**
* Days    : **6d**
* Weeks   : **4w**
* Months  : **12mon**
* Years   : **20y***

##### Change back to default format

``` Swift
TimeLapse.enableDefaultFormat()
```
