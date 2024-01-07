//
//  Date.swift
//  iDrive
//
//  Created by Samy Mehdid on 23/12/2023.
//

import Foundation

extension Date {
    func hoursBetween(secondDate: Date) -> Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.hour], from: self, to: secondDate)
        return components.hour ?? 0
    }
}

extension Date {
    func getFormattedDate(format: String = "dd/mm/yyyy") -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = format
        return dateformat.string(from: self)
    }
}
