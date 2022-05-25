//
//  MainTabBarViewController.swift
//  BeFine
//
//  Created by shahadmufleh on 08/03/2022.
//

import UIKit
import UserNotifications
class MainTabBarViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        notificationHandeler()
        configureTabItems()
    }
    
    func configureTabItems(){
        let scheduleVC = UINavigationController(rootViewController: ScheduleViewController())
        let medsVC = UINavigationController(rootViewController: MedsViewController())
        let testsVC = UINavigationController(rootViewController: TestsViewController())
        setViewControllers([ scheduleVC, medsVC, testsVC], animated: true)
        scheduleVC.tabBarItem.image = UIImage(systemName: "calendar")
        scheduleVC.title = "Schedule"
        scheduleVC.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem:.add, target: self, action: nil)
        medsVC.tabBarItem.image = UIImage(systemName: "pills.fill")
        medsVC.title = "Medications"
        medsVC.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem:.add, target: self, action: #selector(medsAddButton))
        testsVC.tabBarItem.image = UIImage(systemName: "drop.fill")
        testsVC.title = "Tests"
        testsVC.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem:.add, target: self, action: #selector(testAddButton))
        tabBar.tintColor = UIColor(red: 0.314, green: 0.624, blue: 0.71, alpha: 1)
        
    }
    @objc func buttonAction(sender: UIButton!) {
        self.present(UINavigationController(rootViewController: AddTestSegment()), animated: true, completion: nil)
     }
    
    @objc func testAddButton(){
        self.present(UINavigationController(rootViewController: AddTestSegment()), animated: true, completion: nil)
    }
    @objc func medsAddButton(){
        self.present(UINavigationController(rootViewController: MedicationAddSheetView()), animated: true, completion: nil)
        
    }
     func configureItems(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem:.add, target: self, action: #selector(buttonAction))
    }
    
    func notificationHandeler(){
        // 1- Ask for permission
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound]){(greanted, error) in}
        // 2- noti content
        let content = UNMutableNotificationContent()
        let time = date
       // let name = vc.MedsTextField.text!
        content.title = "Hi, it's time for your medication."
        content.body = "Please don't forget to take your \(time) Metformin"
        content.sound = .default
        // 3- when appears .. trigger
        let date = Date().addingTimeInterval(5)
        let dateComponent = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: false)
        // 4- create th erequest
        let uuidString = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
        // 5- register the request
        center.add(request) {(error) in }
        
    }

}
