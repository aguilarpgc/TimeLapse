//
//  TimeLapse.swift
//
//
//  Created by Paul Aguilar on 9/25/18.
//

public extension Int {
    
    public func timeLapseFormat() -> String {
        
        let seconds: Int = self
        
        if seconds < Int.secondsOnADay {
            
            if seconds < 10 {
                
                return "ahora"
                
            } else if seconds < 60 {
                
                return "\(seconds) seg"
                
            } else if seconds < Int.secondsOnAnHour {
                
                let min: Int = seconds / 60
                
                return "\(min) min"
                
            } else {
                
                let hours: Int = seconds / Int.secondsOnAnHour
                
                return "\(hours) \(hours == 1 ? "hr" : "hrs")"
            }
            
        } else if seconds < Int.secondsOnAWeek {
            
            let days = seconds / (Int.secondsOnADay)
            
            return "\(days) \(days == 1 ? "día" : "días")"
            
        } else if seconds < Int.secondsOnAMonth {
            
            let weeks = seconds / (Int.secondsOnAWeek)
            
            return "\(weeks) sem"
            
        } else if seconds < Int.secondsOnAYear {
            
            let months = seconds / (Int.secondsOnAMonth)
            
            return "\(months) \(months == 1 ? "mes" : "meses")"
            
        } else {
            
            let years = seconds / (Int.secondsOnAYear)
            
            return "\(years) \(years == 1 ? "año" : "años")"
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
