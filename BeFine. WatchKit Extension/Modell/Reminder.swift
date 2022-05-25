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

public class ReminderModel: NSObject,  WCSessionDelegate, ObservableObject {
    var session: WCSession
    @Published var reminders: [ReminderType] = [
        ReminderType(id: UUID(), titleOfReminder: "Today's Meds", symbolName: "pills.fill6", name: "Metformin", time: "02:00 PM"),
        ReminderType(id: UUID(), titleOfReminder: "Today's Tests", symbolName: "Test", name: "Daily test", time: "09:00 AM")

    ]
    init(session: WCSession = .default){
        self.session = session
        super.init()
        self.session.delegate = self
        session.activate()
    }
    
    
    public func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    public func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        DispatchQueue.main.async {
            self.reminders[0].name = message["message"] as? String ?? "Unknown"
            self.reminders[0].time =  message["messageForTime"] as? String ?? "Not Found"
            
        }
        
    }
    
}
