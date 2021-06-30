//
//  TimeLapse.swift
//
//
//  Created by Paul Aguilar on 9/25/18.
//

import Foundation

public struct TimeLapse {
    public static var format: TimeLapseFormat = TimeLapseDefaultFormat()
    public static var justNowSecondsLimit: Int = 5
    
    public static func setDefaultFormat() {
        TimeLapse.format = TimeLapseDefaultFormat()
    }
}

public extension Date {
    func elapsedTime(until date: Date = Date()) -> String {
        return Int(date.timeIntervalSince(self)).shortTimeLapse()
    }
}

public extension Int {
    func shortTimeLapse() -> String {
        let seconds: Int = self
        let format = TimeLapse.format
        
        switch seconds {
            
        case ..<TimeLapse.justNowSecondsLimit:
            return format.now
        case ..<Int.secondsOnAMinute:
            return "\(seconds)\(format.second)"
        case ..<Int.secondsOnAnHour:
            let min: Int = seconds / Int.secondsOnAMinute
            return "\(min)\(format.minute)"
        case ..<Int.secondsOnADay:
            let hours: Int = seconds / Int.secondsOnAnHour
            return "\(hours)\(format.hour)"
        case ..<Int.secondsOnAWeek:
            let days = seconds / (Int.secondsOnADay)
            return "\(days)\(format.day)"
        case ..<Int.secondsOnAMonth:
            let weeks = seconds / (Int.secondsOnAWeek)
            return "\(weeks)\(format.week)"
        case ..<Int.secondsOnAYear:
            let months = seconds / (Int.secondsOnAMonth)
            return "\(months)\(format.month)"
        default:
            let years = seconds / (Int.secondsOnAYear)
            return "\(years)\(format.year)"
        }
    }
}

private extension Int {
    static let secondsOnAMinute =         60 // 60
    static let secondsOnAnHour  =      3_600 // 60 * 60
    static let secondsOnADay    =     86_400 // 60 * 60 * 24
    static let secondsOnAWeek   =    604_800 // 60 * 60 * 24 * 7
    static let secondsOnAMonth  =  2_592_000 // 60 * 60 * 24 * 30
    static let secondsOnAYear   = 31_536_000 // 60 * 60 * 24 * 365
}
