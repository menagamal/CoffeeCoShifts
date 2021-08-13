//
//  Date+Extension.swift
//  CoffeeCoShifts
//
//  Created by Mena Gamal on 13/08/2021.
//

import Foundation
import UIKit

extension DateFormatter {
    static let iso8601Full: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss -08:00"
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter
    }()

    static let dateOnly: DateFormatter = {
         let formatter = DateFormatter()
         formatter.dateFormat = "E, MM/yy"
         return formatter
    }()
    
    static let timeOnly: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a"
        formatter.amSymbol = "AM"
        formatter.pmSymbol = "PM"
        return formatter
    }()
    

    static func stringDateOnly(iso string: String) -> String  {
        if let date = DateFormatter.iso8601Full.date(from: string) {
            return  DateFormatter.dateOnly.string(from: date)
        }
        return ""
    }
    static func stringTimeOnly(iso string: String) -> String  {
        if let date = DateFormatter.iso8601Full.date(from: string) {
            return  DateFormatter.timeOnly.string(from: date)
        }
        return ""
    }
    
    static func stringFromDateWithIso8601Full(date: Date) -> String  {
        return  DateFormatter.iso8601Full.string(from: date)
    }
}
