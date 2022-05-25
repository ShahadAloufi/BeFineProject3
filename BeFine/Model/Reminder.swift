//
//  Reminder.swift
//  BeFine
//
//  Created by shahadmufleh on 08/03/2022.
//
import Foundation
import UIKit

enum ReminderTypeStyle: String {
    case pills = "Pills"
    case insulin = "Insulin"
    case past = "Past"
    case upcoming = "Upcoming"
    case test = "Test"
    case daily = "Daily"
    case AC1 = "AC1"
    
    var name: String {
        switch self {
        case .pills:
            return "Pills"
        case .insulin:
            return "Insulin"
        case .past:
            return "Past"
        case .upcoming:
            return "Upcoming"
        case .test:
            return "Test"
        case .daily:
            return "Daily"
        case .AC1:
            return "AC1"
        }
    }
}

struct listTimes{
var timename :String
var timepicker : UIDatePicker
}

struct cellItems{
    var leftItemFromStruct: String
}
struct days{
    var day: String
    var isChecked: Bool
}

var daysArray = [
days(day: "Sun", isChecked: false), days(day: "Mon", isChecked: false),
days(day: "Tue", isChecked: false), days(day: "Wed", isChecked: false),
days(day: "Thur", isChecked: false), days(day: "Fri", isChecked: false),
days(day: "Sat", isChecked: false)
]

var daysArr = [
    days(day: "Sun", isChecked: false), days(day: "Mon", isChecked: false),
    days(day: "Tue", isChecked: false), days(day: "Wed", isChecked: false),
    days(day: "Thur", isChecked: false), days(day: "Fri", isChecked: false),
    days(day: "Sat", isChecked: false)
]
