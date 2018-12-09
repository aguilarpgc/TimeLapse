# TimeLapse

Simple `Int` extension with time lapse description

Converts `Int` (seconds) to a formatted short length `String`

## Usage

### Default

* **Seconds** : `print(10.shortTimeLapse())`   10s

* **Minutes** : `print(1800.shortTimeLapse())`   30m

* **Hours**  : `print(43200.shortTimeLapse())`   12h

* **Days**  : `print(172_800.shortTimeLapse())`    2d

* **Weeks**  : `print(604_800.shortTimeLapse())`   1w

* **Months**  : `print(15_552_000.shortTimeLapse())`   6mo

* **Years**  : `print(31_536_000.shortTimeLapse())`   1y

### Custom

Conforts to the protocol `TimeLapseFormat` and assign it to `TimeLapse.format`

#### Example

``` Swift
struct CustomTimeLapseFormat: TimeLapseFormat {

    var now: String    = "now"
    var second: String = "sec"
    var minute: String = "min"
    var hour: String   = "hour"
    var day: String    = "d"
    var week: String   = "w"
    var month: String  = "mon"
    var year: String   = "y"
}
```
##### Then:

``` Swift
TimeLapse.format = CustomTimeLapseFormat()
```

##### Result: 

* `0.shortTimeLapse()` now
* `10.shortTimeLapse()` 10sec
* `1800.shortTimeLapse()` 30min
* `7200.shortTimeLapse()` 2hour
* `604_799.shortTimeLapse()` 6d
* `2_591_999.shortTimeLapse()` 4w
* `31_535_999.shortTimeLapse()` 12mon
* `630_720_000.shortTimeLapse()` 20y

##### Change back to default format

``` Swift
TimeLapse.enableDefaultFormat()
```


