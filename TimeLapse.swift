//
//  TimeLapse.swift
//  
//
//  Created by Paul Aguilar on 9/25/18.
//

extension Int {

    func timeLapseFormat() -> String {

        let selfSeconds: Int = self / 1000

        let secondsOnADay = 60 * 60 * 24

        if selfSeconds < secondsOnADay {

            if selfSeconds < 10 {

                return "ahora"

            } else if selfSeconds < 60 {

                return "\(selfSeconds) seg"

            } else if selfSeconds < 60 * 60 {

                let min: Int = selfSeconds / 60

                return "\(min) \(min == 1 ? "min" : "mins")"

            } else {

                let hours: Int = selfSeconds / (60 * 60)

                return "\(hours) \(hours == 1 ? "hr" : "hrs")"
            }

        } else if selfSeconds < 7 * secondsOnADay {

            let days = selfSeconds / (secondsOnADay)

            return "\(days) \(days == 1 ? "día" : "días")"

        } else if selfSeconds < 30 * secondsOnADay {

            let weeks = selfSeconds / (secondsOnADay * 7)

            return "\(weeks) sem"

        } else if selfSeconds < 365 * secondsOnADay {

            let months = selfSeconds / (secondsOnADay * 30)

            return "\(months) \(months == 1 ? "mes" : "meses")"

        } else {

            let years = selfSeconds / (secondsOnADay * 365)

            return "\(years) \(years == 1 ? "año" : "años")"
        }
    }
}
