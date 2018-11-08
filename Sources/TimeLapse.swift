//
//  TimeLapse.swift
//
//
//  Created by Paul Aguilar on 9/25/18.
//


public struct TimeLapse {
    
    public static var format: TimeLapseFormat = TimeLapseFormatDefault()
    
    public static func setDefaultTimeLapseFormat() {
        
        TimeLapse.format = TimeLapseFormatDefault()
    }
}

public extension Int {
    
    public func shortTimeLapse() -> String {
        
        let seconds: Int = self
        let format = TimeLapse.format
        
        if seconds < Int.secondsOnADay {
            
            if seconds < 10 {
                
                return format.now
                
            } else if seconds < 60 {
                
                return "\(seconds)\(format.second)"
                
            } else if seconds < Int.secondsOnAnHour {
                
                let min: Int = seconds / 60
                
                return "\(min)\(format.minute)"
                
            } else {
                
                let hours: Int = seconds / Int.secondsOnAnHour
                
                return "\(hours)\(format.hour)"
            }
            
        } else if seconds < Int.secondsOnAWeek {
            
            let days = seconds / (Int.secondsOnADay)
            
            return "\(days)\(format.day)"
            
        } else if seconds < Int.secondsOnAMonth {
            
            let weeks = seconds / (Int.secondsOnAWeek)
            
            return "\(weeks)\(format.week)"
            
        } else if seconds < Int.secondsOnAYear {
            
            let months = seconds / (Int.secondsOnAMonth)
            
            return "\(months)\(format.month)"
            
        } else {
            
            let years = seconds / (Int.secondsOnAYear)
            
            return "\(years)\(format.year)"
        }
    }
}

private extension Int {
    
    static let secondsOnAnHour =      3_600  // 60 * 60
    static let secondsOnADay   =     86_400  // 60 * 60 * 24
    static let secondsOnAWeek  =    604_800  // 60 * 60 * 24 * 7
    static let secondsOnAMonth =  2_592_000  // 60 * 60 * 24 * 30
    static let secondsOnAYear  = 31_536_000  // 60 * 60 * 24 * 365
    
}


public protocol TimeLapseFormat {
    
    var now    : String { get }
    var second : String { get }
    var minute : String { get }
    var hour   : String { get }
    var day    : String { get }
    var week   : String { get }
    var month  : String { get }
    var year   : String { get }
    
}

public struct TimeLapseFormatDefault: TimeLapseFormat {
    
    public let now    = "just now"
    public let second = "s"
    public let minute = "m"
    public let hour   = "h"
    public let day    = "d"
    public let week   = "w"
    public let month  = "mo"
    public let year   = "y"
}
