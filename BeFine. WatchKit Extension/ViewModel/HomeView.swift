//
//  ContentView.swift
//  BeFine. WatchKit Extension
//
//  Created by shahadmufleh on 10/05/2022.
//


import SwiftUI
import UserNotifications
import HealthKit
import WatchConnectivity
struct HomeView: View {
    private var healthStore = HKHealthStore()
   
   // var reminderViewModel2: HomeView2
    let heartRateQuantity = HKUnit(from: "count/min")
    let content = UNMutableNotificationContent()
    @ObservedObject var reminderViewModel = ReminderModel()
   // @ObservedObject var reminderTime = HomeView2()
    var body: some View {
        NavigationView {
            VStack {
                ForEach(reminderViewModel.reminders) { reminder in
                    NavigationLink(destination: RowDetailView(reminderViewModel: reminder, buttonIsPressed: false, skipButtonPressed: false, reminderViewModel2: reminderViewModel), label:{
                        VStack{
                            Image(reminder.symbolName)
                            Text(reminder.titleOfReminder)
                        }
                        .accessibilityRespondsToUserInteraction(true)
                        .accessibilityAddTraits(.isButton)
                        .font(.footnote)
                    })
                }
            }
            .onAppear(perform: Notification)
            .onAppear(perform: start)
            .environmentObject(reminderViewModel)
            .navigationTitle("Today's Schedule")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    
}

extension HomeView {
    func start() {
        autorizeHealthKit()
        startHeartRateQuery(quantityTypeIdentifier: .heartRate)
        print(heartRateQuantity)

    }
    func Notification(){
        
        // 1- Ask for permission
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound]){(greanted, error) in}
        
        // 2- noti content
        let content = UNMutableNotificationContent()
        content.title = "Hi, it's time for your medication."
        content.body = "Please don't forget to take your 8:25 AM Metformin"
        
        // 3- when appears .. trigger
        let date = Date().addingTimeInterval(5)
        let dateComponent = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: false)
        
        // 4- create the erequest
        let uuidString = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
        
        // 5- register the request
        center.add(request) {(error) in }
    }
    
    func NotificationHeartBeats(){
        
        // 1- Ask for permission
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound]){(greanted, error) in}
        
        // 2- noti content
        let content = UNMutableNotificationContent()
        content.title = "Heart Rate"
        content.body = "Your heart rate rose above 120 BPM, please check your blood sugar levels for your safety"

        // 3- when appears .. trigger
        let date = Date().addingTimeInterval(5)
        let dateComponent = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: false)

        // 4- create the erequest
        let uuidString = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)

        // 5- register the request
        center.add(request) {(error) in }
    }
    func process(_ samples: [HKQuantitySample], type: HKQuantityTypeIdentifier) {
        var lastHeartRate = 0.0
        
        for sample in samples {
            if type == .heartRate {
                lastHeartRate = sample.quantity.doubleValue(for: heartRateQuantity)
            }
        }
        if lastHeartRate > 120{
            NotificationHeartBeats()
        }else {
            print("stable heartbeats")
        }
    }

    func autorizeHealthKit() {
        let healthKitTypes: Set = [
        HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.heartRate)!]
        healthStore.requestAuthorization(toShare: healthKitTypes, read: healthKitTypes) { _, _ in }
    }
    
    private func startHeartRateQuery(quantityTypeIdentifier: HKQuantityTypeIdentifier) {
        // 1
        let devicePredicate = HKQuery.predicateForObjects(from: [HKDevice.local()])
        // 2
        let updateHandler: (HKAnchoredObjectQuery, [HKSample]?, [HKDeletedObject]?, HKQueryAnchor?, Error?) -> Void = {
            query, samples, deletedObjects, queryAnchor, error in
            
            // 3
        guard let samples = samples as? [HKQuantitySample] else {
            return
        }
            
        self.process(samples, type: quantityTypeIdentifier)
        }
        // 4
        let query = HKAnchoredObjectQuery(type: HKObjectType.quantityType(forIdentifier: quantityTypeIdentifier)!, predicate: devicePredicate, anchor: nil, limit: HKObjectQueryNoLimit, resultsHandler: updateHandler)
        query.updateHandler = updateHandler
        // 5
        healthStore.execute(query)
    }
    
    
}



public class ReminderModel: NSObject,  WCSessionDelegate, ObservableObject {
    var session: WCSession
    @Published var messageTextName1 = ""
    @Published var messageTextTime1 = ""
    @Published var messageTextNameForTest = ""
    @Published var messageTextTimeForTest = ""
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
 
//
//                     self.messageTextName1 = message["message"] as? String ?? "Unknown"
//                     self.messageTextTime1 = message["messageForTime"] as? String ?? "Not Found"
//                     self.messageTextNameForTest = message["message"] as? String ?? "Unknown"
//                     self.messageTextTimeForTest = message["messageForTime"] as? String ?? "Not Found"
            
            self.reminders[0].name = message["message"] as? String ?? "Unknown"
            self.reminders[0].time =  message["messageForTime"] as? String ?? "Not Found"
            
        }
        
    }
    
    
    
    
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView()
//
//    }
//}
