# TimeLapse

[![Swift](https://img.shields.io/badge/swift-4.2-orange.svg?style=flat)](https://developer.apple.com/swift/)
[![License](https://img.shields.io/badge/license-MIT-71787A.svg)](https://tldrlegal.com/license/mit-license)

Simple `Int` extension with time lapse description

Converts `Int` (seconds) to a formatted short length `String`

## Usage

### Default

* Now :  `2.shortTimeLapse()`  **just now**
* Seconds :  `10.shortTimeLapse()`   **10s**
* Minutes :  `1800.shortTimeLapse()`   **30m**
* Hours  : `43200.shortTimeLapse()`   **12h**
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
    var minute : String = "min"
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
* Minutes: `1800.shortTimeLapse()` **30min**
* Hours: `7200.shortTimeLapse()` **2hour**
* Days: `604_799.shortTimeLapse()` **6d**
* Weeks: `2_591_999.shortTimeLapse()` **4w**
* Months: `31_535_999.shortTimeLapse()` **12mon**
* Years: `630_720_000.shortTimeLapse()` **20y**

##### Change back to default format

``` Swift
TimeLapse.enableDefaultFormat()
```


