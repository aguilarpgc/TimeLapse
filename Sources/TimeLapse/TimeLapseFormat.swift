//
//  TimeFormat.swift
//  TimeLapse
//
//  Created by Paul Aguilar on 12/9/18.
//

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

public struct TimeLapseDefaultFormat: TimeLapseFormat {
    
    public let now    = "just now"
    public let second = "s"
    public let minute = "min"
    public let hour   = "h"
    public let day    = "d"
    public let week   = "w"
    public let month  = "mo"
    public let year   = "y"
}
