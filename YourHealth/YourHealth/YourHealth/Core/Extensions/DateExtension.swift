//
//  DateExtension.swift
//  YourHealth
//
//  Created by Rostyslav Mykhal on 5/10/25.
//

import Foundation

extension Date {
    static var startOfDay: Date {
        let calendar = Calendar.current
        return calendar.startOfDay(for: Date())
    }
}
