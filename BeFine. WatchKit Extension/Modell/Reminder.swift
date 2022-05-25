//
//  Reminder.swift
//  BeFine. WatchKit Extension
//
//  Created by shahadmufleh on 10/05/2022.
//


import Foundation
import UIKit
import WatchConnectivity
struct ReminderType: Identifiable {
    var id: UUID
    var titleOfReminder: String
    var symbolName: String
    var name: String
    var time: String
}

//class ReminderViewModel: NSObject, WCSessionDelegate, ObservableObject {
//    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
//        //
//    }
//
//    //this published prop will alert the class of any changes in the reminderType model
//    @Published var reminders: [ReminderType] = [
//        ReminderType(id: UUID(), titleOfReminder: "Today's Meds", symbolName: "pills.fill6", name: "Metformin", time: "02:00 PM"),
//        ReminderType(id: UUID(), titleOfReminder: "Today's Tests", symbolName: "Test", name: "Daily test", time: "09:00 AM")
//
//    ]
//
//}
