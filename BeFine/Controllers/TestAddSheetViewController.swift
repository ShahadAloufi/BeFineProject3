//
//  AddTestSegment.swift
//  BeFine
//
//  Created by shahadmufleh on 23/03/2022.
//

import UIKit
import WatchConnectivity
class AddTestSegment: UIViewController, WCSessionDelegate {
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        //
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        //
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        //
    }
    
    let secondVC = AddDailyTestVC()
    let thirdVC = AddAC1TestVC()
    var steppernum = UILabel()
    var session: WCSession?
    
    var segment: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Tests"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action:#selector(Save))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem:.cancel, target: self, action: #selector(handleCancel))
        addChild(secondVC)
        addChild(thirdVC)
        self.view.addSubview(secondVC.view)
        self.view.addSubview(thirdVC.view)
        thirdVC.view.isHidden = true
        segment = UISegmentedControl(items: ["Daily", "AC1"])
        segment.selectedSegmentIndex = 0
        segment.selectedSegmentTintColor = UIColor(red: 0.314, green: 0.624, blue: 0.71, alpha: 1)
        segment.addTarget(self, action: #selector(typetest(_:)), for: .valueChanged)
        self.view.addSubview(segment)
        segment.translatesAutoresizingMaskIntoConstraints              = false
        segment.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant:-250).isActive = true
        segment.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        segment.widthAnchor.constraint(equalToConstant: 400).isActive = true
        segment.heightAnchor.constraint(equalToConstant: 40).isActive = true
        segment.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 16).isActive = true
        segment.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -16).isActive = true
        SetupForWatchSession()
    }
    
    
    
    @objc func typetest(_ segment: UISegmentedControl) {
        secondVC.view.isHidden = true
        thirdVC.view.isHidden = true
        if segment.selectedSegmentIndex == 0 {
            secondVC.view.isHidden = false
           
            print("Daily test")
        }
        else{
            thirdVC.view.isHidden = false

            segmentvalue = ac1
            print("AC1")
        }
        
    }
    
    
    @objc func Save(_ sender: UIButton) {
       let vc = ScheduleViewController()
        if segment.selectedSegmentIndex != 1{
            let name = "Daily"
            let frequency = testDay
            let dose = secondVC.yValue.text!
            let time = selectedDteForTests
            vc.createAReminder(name: name, dose: "Take  \(dose)", frequency: frequency, time: time, image: "Test")
            
            if let validSession = self.session, validSession.isReachable{
                let dataToWatch: [String: Any] = ["messageTestName": name , "messageForTimeTest": selectedDteForTests as Any]
                validSession.sendMessage(dataToWatch, replyHandler: nil, errorHandler: nil)
               
           
            }
        }else{
            
            let name = "AC1"
            let frequency = testDay
            let dose = secondVC.yValue.text!
            let time = selectedDteForTests
            vc.createAReminder(name: name, dose: "Take  \(dose)", frequency: frequency, time: time, image: "Test")
        }
       
        
        
        
        self.dismiss(animated: true) {
            NotificationCenter.default.post(name: .reload, object: nil)
           
        }
    }
    

    @objc private  func handleCancel() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func SetupForWatchSession(){
        if WCSession.isSupported(){
            session = WCSession.default
        
            session?.delegate = self
       
            session?.activate()
          
            
        }
    }
    
}


