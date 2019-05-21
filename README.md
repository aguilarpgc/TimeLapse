# TimeLapse

[![Version](https://img.shields.io/github/tag/aguilarpgc/TimeLapse.svg?colorB=blue&label=release&style=flat)](https://github.com/aguilarpgc/TimeLapse/releases)
[![Swift](https://img.shields.io/badge/swift-5.0-orange.svg?style=flat)](https://developer.apple.com/swift/)
[![Platform](https://img.shields.io/badge/platform-ios%20%7C%20macos%20%7C%20tvos%20%7C%20watchos-lightgrey.svg)](https://developer.apple.com/swift/)
[![License](https://img.shields.io/badge/license-MIT-71787A.svg)](https://tldrlegal.com/license/mit-license)

`Date` extension that compares another `Date` with current time, converts it in seconds and returns a formatted time lapse description.

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

// some dates
let date0  = dateFormatter.date(from: "24/12/2018 23:59:58")!
let date1  = dateFormatter.date(from: "24/12/2018 23:59:09")!
let date2  = dateFormatter.date(from: "24/12/2018 23:52:59")!
let date3  = dateFormatter.date(from: "24/12/2018 18:59:59")!
let date4  = dateFormatter.date(from: "23/12/2018 23:59:59")!
let date5  = dateFormatter.date(from: "09/12/2018 23:59:59")!
let date6  = dateFormatter.date(from: "24/11/2018 23:59:59")!
let date7  = dateFormatter.date(from: "24/12/2016 23:59:59")!

date0.elapsedTime(until: fakeCurrentDate)
date1.elapsedTime(until: fakeCurrentDate)
date2.elapsedTime(until: fakeCurrentDate)
date3.elapsedTime(until: fakeCurrentDate)
date4.elapsedTime(until: fakeCurrentDate)
date5.elapsedTime(until: fakeCurrentDate)
date6.elapsedTime(until: fakeCurrentDate)
date7.elapsedTime(until: fakeCurrentDate)
```

* Just Now : **just now**
* Seconds  : **50s**
* Minutes  : **7min**
* Hours    : **5h**
* Days     : **1d**
* Weeks    : **2w**
* Months   : **1mo**
* Years    : **2y**

#### Int (Seconds)

``` Swift
2.shortTimeLapse()
10.shortTimeLapse()
1800.shortTimeLapse()
43200.shortTimeLapse()
172_800.shortTimeLapse()
604_800.shortTimeLapse()
15_552_000.shortTimeLapse()
31_536_000.shortTimeLapse()
```
* Just Now : **just now**
* Seconds  : **10s**
* Minutes  : **30min**
* Hours    : **12h**
* Days     : **2d**
* Weeks    : **1w**
* Months   : **6mo**
* Years    : **1y**

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

``` Swift
0.shortTimeLapse()
10.shortTimeLapse()
1800.shortTimeLapse()
7200.shortTimeLapse()
604_799.shortTimeLapse()
2_591_999.shortTimeLapse()
31_535_999.shortTimeLapse()
630_720_000.shortTimeLapse()
```

* Just Now : **now**
* Seconds  : **10sec**
* Minutes  : **30m**
* Hours    : **2hour**
* Days     : **6d**
* Weeks    : **4w**
* Months   : **12mon**
* Years    : **20y**

##### Change back to default format

``` Swift
TimeLapse.enableDefaultFormat()
```
