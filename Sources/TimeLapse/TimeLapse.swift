//
//  TimeLapse.swift
//
//
//  Created by Paul Aguilar on 9/25/18.
//

import Foundation

public struct TimeLapse {
    
    public static var format: TimeLapseFormat = TimeLapseDefaultFormat()
    
    public static func setDefaultFormat() {
        
        TimeLapse.format = TimeLapseDefaultFormat()
    }
}

public extension Date {
    
    public func elapsedTime(until date: Date = Date()) -> String {
        
        return Int(date.timeIntervalSince(self)).shortTimeLapse()
    }
}

public extension Int {
    
    public func shortTimeLapse() -> String {
        
        let seconds: Int = self
        let format = TimeLapse.format
        
        if seconds < Int.secondsOnADay {
            
            if seconds < 10 {
                
                return format.now
                
            } else if seconds < Int.secondsOnAMinute {
                
                return "\(seconds)\(format.second)"
                
            } else if seconds < Int.secondsOnAnHour {
                
                let min: Int = seconds / Int.secondsOnAMinute
                
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
    
    static let secondsOnAMinute =         60  // 60
    static let secondsOnAnHour  =      3_600  // 60 * 60
    static let secondsOnADay    =     86_400  // 60 * 60 * 24
    static let secondsOnAWeek   =    604_800  // 60 * 60 * 24 * 7
    static let secondsOnAMonth  =  2_592_000  // 60 * 60 * 24 * 30
    static let secondsOnAYear   = 31_536_000  // 60 * 60 * 24 * 365
    
}
