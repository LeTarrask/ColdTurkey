//
//  extension date isGreaterThan.swift
//  ColdTurkey
//
//  Created by tarrask on 25/07/2022.
//

import Foundation

extension Date {
    func isAfter(_ date: Date) -> Bool {      
        let order = Calendar.current.compare(Date.now, to: date, toGranularity: .day)
        
        switch order {
        case .orderedDescending, .orderedSame:
            return true
        case .orderedAscending:
            return false
        }
    }
}

