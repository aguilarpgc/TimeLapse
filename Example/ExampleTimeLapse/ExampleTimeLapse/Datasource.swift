//
//  Datasource.swift
//  ExampleTimeLapse
//
//  Created by aguilarpgc on 1/17/19.
//  Copyright © 2019 Paul Aguilar. All rights reserved.
//

import Foundation

struct Datasource {
    
    static var shared = Datasource()
    
    private (set) var items: [Item] = []
    
    private init() {
        
        items = Item.defaultData()
    }
    
    mutating func reload() {
        
        items = Item.defaultData()
    }
}

struct Item {
    
    var date: Date
    
    var desc: String {
        
        let formatter = DateFormatter()
        
        formatter.dateFormat = "dd/MM/yyyy HH:mm:ss"
        
        return formatter.string(from: date)
    }
}

extension Item {
    
    static func defaultData() -> [Item] {
        
        var temp: [Item] = []
        
        let currentDate = Date()
        
        for _ in 0..<30 {
            
            let daysOff    = Bool.random() ? -Int.random(in: 0..<500)   : 0
            let secondsOff = Bool.random() ? -Int.random(in: 0..<3_600) : -Int.random(in: 0..<86_400)
            
            var components = DateComponents()
            
            components.second = secondsOff
            components.day    = daysOff
            
            let date = Calendar.current.date(byAdding: components, to: currentDate)!
            
            let item = Item(date: date)
            
            temp.append(item)
        }
        
        return temp.sorted(by: { $0.date > $1.date })
    }
}
