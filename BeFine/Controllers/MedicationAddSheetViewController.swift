//
//  segmentVC2ViewController.swift
//  BeFine
//
//  Created by Shorouq Alyami on 13/03/2022.
//

import UIKit
import WatchConnectivity
import SwiftUI
class MedicationAddSheetView: UIViewController {
    var session: WCSession?
    
    var safeArea: UILayoutGuide!
    var x = 0
    var y = 0
    var times = [listTimes]()
    let headerView = UIView()
   
    let xValue: UILabel = {
        let xValue = UILabel()
        xValue.text = "0"
        return xValue
    }()
   
    let yValue: UILabel =
    {
        let yValue = UILabel()
        yValue.text = "0"
        return yValue
    }()
    
    var PlusButtonForPills: UIButton = {
        let PlusButtonForPills = UIButton()
        PlusButtonForPills.setTitle("+", for: .normal)
        PlusButtonForPills.layer.cornerRadius = 10
        PlusButtonForPills.setTitleColor(.white, for: .normal)
        PlusButtonForPills.backgroundColor = .systemGray5
        PlusButtonForPills.addTarget(self, action: #selector(PillsPlus), for: .touchUpInside)
        return PlusButtonForPills
    }()
   
    var MinusButtonForpills: UIButton = {
        let MinusButtonForpills = UIButton()
        MinusButtonForpills.setTitle("-", for: .normal)
        MinusButtonForpills.layer.cornerRadius = 10
        MinusButtonForpills.setTitleColor(.white, for: .normal)
        MinusButtonForpills.backgroundColor = .systemGray5
        MinusButtonForpills.addTarget(self, action: #selector(PillsMinus(_:)), for: .touchUpInside)
        return MinusButtonForpills
    }()
  
    var PlusButtonForTime: UIButton = {
        let PlusButtonForTime = UIButton()
        PlusButtonForTime.setTitle("+", for: .normal)
        PlusButtonForTime.layer.cornerRadius = 10
        PlusButtonForTime.setTitleColor(.white, for: .normal)
        PlusButtonForTime.backgroundColor = .systemGray5
        PlusButtonForTime.addTarget(self, action: #selector(TimesPlus(_:)), for: .touchUpInside)
        return PlusButtonForTime
    }()
   
    var MinusButtonForTime: UIButton = {
        let MinusButtonForTime = UIButton()
        MinusButtonForTime.setTitle("-", for: .normal)
        MinusButtonForTime.layer.cornerRadius = 10
        MinusButtonForTime.setTitleColor(.white, for: .normal)
        MinusButtonForTime.backgroundColor = .systemGray5
        MinusButtonForTime.addTarget(self, action: #selector(TimesMinus(_:)), for: .touchUpInside)
        return MinusButtonForTime
    }()
   
    var segment: UISegmentedControl =
    {
      let segment = UISegmentedControl(items: ["Pills", "Injection"])
      segment.selectedSegmentIndex = 0
      segment.selectedSegmentTintColor = UIColor(red: 0.314, green: 0.624, blue: 0.71, alpha: 1)
      return segment
    }()
   
    var tableView: UITableView =
    {
        let tableView = UITableView()
        tableView.register(ListCell2.self, forCellReuseIdentifier: "timeCell2")
       
        return tableView
    }()
  
    var MedsName: UILabel =
    {
        let MedsName = UILabel()
        MedsName.text = "Medication Name"
        MedsName.highlightedTextColor = .white
        MedsName.font = .boldSystemFont(ofSize: 18)
        MedsName.textColor = UIColor.white
        return MedsName
    }()
   
    var Repeatbutton: UIButton =
    {
        let Repeatbutton = UIButton()
        Repeatbutton.configuration = .tinted()
        Repeatbutton.configuration?.image = UIImage(systemName: "chevron.right")
        Repeatbutton.configuration?.baseBackgroundColor = .systemGray
        Repeatbutton.configuration?.imagePadding = 260
        Repeatbutton.configuration?.imagePlacement = .trailing
        Repeatbutton.configuration?.cornerStyle = .medium
        Repeatbutton.configuration?.title = "Repeat"
        Repeatbutton.tintColor = .white
        Repeatbutton.addTarget(self, action: #selector(repeatbutton), for: .touchUpInside)
        return Repeatbutton
    }()
   
    var MedsTextField:  UITextField =
    {
        let MedsTextField = UITextField()
        MedsTextField.placeholder = "Medication Name"
        MedsTextField.textColor = UIColor.white
        MedsTextField.borderStyle = UITextField.BorderStyle.roundedRect
        MedsTextField.backgroundColor = .systemGray5
        MedsTextField.layer.cornerRadius = 30
        return MedsTextField
    }()
   
    var MedsType: UILabel =
    {
        let MedsType = UILabel()
        MedsType.text = "Medication Type"
        MedsType.font = .boldSystemFont(ofSize: 18)
        return MedsType
    }()
  
    var HowManyTimes: UILabel =
    {
        let HowManyTimes = UILabel()
        HowManyTimes.text = "How many times a day?"
        HowManyTimes.font = .boldSystemFont(ofSize: 18)
        HowManyTimes.textColor = UIColor.white
        return HowManyTimes
    }()
  
    var Dose: UILabel =
    {
        let Dose = UILabel()
        Dose.text = "How many pill each time?"
        Dose.font = .boldSystemFont(ofSize: 18)
        Dose.textColor = UIColor.white
        return Dose
    }()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        ConfigureView()
       tableView.delegate = self
       tableView.dataSource = self
       self.view.addSubview(headerView)
       self.view.addSubview(tableView)
       self.view.addSubview(segment)
       headerView.addSubview(MedsName)
       headerView.addSubview(MedsTextField)
       headerView.addSubview(PlusButtonForPills)
       headerView.addSubview(MinusButtonForpills)
       headerView.addSubview(PlusButtonForTime)
       headerView.addSubview(MinusButtonForTime)
       headerView.addSubview(MedsType)
       headerView.addSubview(Repeatbutton)
       headerView.addSubview(HowManyTimes)
       headerView.addSubview(Dose)
       headerView.addSubview(xValue)
       headerView.addSubview(yValue)
       SetupForWatchSession()
       safeArea = view.layoutMarginsGuide
       setUpLayout()
    }
    
   
        

   
}
//It is better to make conformances to protocols in the extensions and not in the definition of the class
extension MedicationAddSheetView: WCSessionDelegate {
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        //
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        //
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        //
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
       //
        
    }
    
    func SetupForWatchSession(){
        if WCSession.isSupported(){
            session = WCSession.default
        
            session?.delegate = self
       
            session?.activate()
          
            
        }
    }
}

//TableView
//It is better to make conformances to protocols in the extensions and not in the definition of the class
extension MedicationAddSheetView: UITableViewDelegate, UITableViewDataSource  {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return times.count
    }
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "timeCell2", for: indexPath) as! ListCell2
        let time = times[indexPath.row]
        cell.set(listTimes: time)
        return cell
    }
  
    // Time increament
    @objc func TimesPlus (_ sender: UIStepper )
    {
       
        if x <= 3 && x >= 0 {
            x += 1
        } else{
            print("Stop")
        }
        xValue.text = "\(x)"
        print(x)

    }
   
    // Time decreament
    @objc func TimesMinus (_ sender: UIStepper )
    {
        if x >= 1 {
            x -= 1
        } else{
            print("Stop")
        }
        
        xValue.text = "\(x)"
        print(x)
    }
   
    // Dose increament
    @objc func PillsPlus () -> String
    {
        if y <= 3 && y >= 0 {
            y += 1
            times.append(listTimes(timename: "Time", timepicker: UIDatePicker() ))
            tableView.reloadData()
        } else{
            print("Stop")
        }

        yValue.text = "\(y)"
        print(y)
        return "\(y)"
    }
  
    
    // Dose decreament
    @objc func PillsMinus(_ sender: UIButton)
    {
        if y >= 1 {
            
            y -= 1
            times.removeLast()
            tableView.reloadData()
            
        } else{
            print("Stop")
        }

        yValue.text = "\(y)"
        print(y)
    }
    
    @objc func SaveToMainTableView() {
        
         if segment.selectedSegmentIndex != 1{
             let vc = ScheduleViewController()
             let name = MedsTextField.text!
             let frequency = day
             let dose = xValue.text!
             let time = selectedDte
             vc.createAReminder(name: name, dose: "Take  \(dose)", frequency: frequency, time: time, image: "pills.fill6")
             if let validSession = self.session, validSession.isReachable{
                 let dataToWatch: [String: Any] = ["message": MedsTextField.text! , "messageForTime": selectedDte as Any]
                 validSession.sendMessage(dataToWatch, replyHandler: nil, errorHandler: nil)
                
            
             }
             
            
            
             
         }else{

             let vc = ScheduleViewController()
             let name = MedsTextField.text!
             let frequency = day
             let dose = xValue.text!
             let time = selectedDte
             vc.createAReminder(name: name, dose: "Take  \(dose)", frequency: frequency, time: time, image: "insulin")
         }
        
       
       
        self.dismiss(animated: true) {
            NotificationCenter.default.post(name: .reload, object: nil)
           
        }

}
    
    func ConfigureView(){
        // Title
        title = "Medication"
        let button = UIBarButtonItem(title: "Add", style: .plain, target: self, action:#selector(SaveToMainTableView))
        self.navigationItem.rightBarButtonItem = button
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem:.cancel, target: self, action: #selector(handleCancel))
        
    }
    
   
    @objc func repeatbutton(){
        let repeatClass = RepeatVC()
        present(repeatClass, animated: true, completion: nil)
    }
   
    
    @objc private  func handleCancel(){
        self.dismiss(animated: true, completion: nil)
    }
    
    func setUpLayout(){
        // header view
        headerView.backgroundColor = .systemBackground
        headerView.translatesAutoresizingMaskIntoConstraints              = false
        headerView.topAnchor.constraint(equalTo:view.topAnchor).isActive = true
        headerView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        headerView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        headerView.bottomAnchor.constraint(equalTo: tableView.topAnchor).isActive = true
        headerView.heightAnchor.constraint(equalToConstant: 560).isActive = true
        
        
        // table view
        tableView.translatesAutoresizingMaskIntoConstraints              = false
        tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        
        // Plus Button for Pills
        PlusButtonForPills.translatesAutoresizingMaskIntoConstraints              = false
        PlusButtonForPills.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: 90).isActive = true
        PlusButtonForPills.widthAnchor.constraint(equalToConstant: 30).isActive = true
        PlusButtonForPills.heightAnchor.constraint(equalToConstant: 30).isActive = true
        PlusButtonForPills.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -16).isActive = true
        
        
        // Minus Button for Pills
        MinusButtonForpills.translatesAutoresizingMaskIntoConstraints              = false
        MinusButtonForpills.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant:90).isActive = true
        MinusButtonForpills.widthAnchor.constraint(equalToConstant: 30).isActive = true
        MinusButtonForpills.heightAnchor.constraint(equalToConstant: 30).isActive = true
        MinusButtonForpills.rightAnchor.constraint(equalTo: view.rightAnchor,constant:-100).isActive = true
        
        
        // Pills Value
        xValue.translatesAutoresizingMaskIntoConstraints              = false
        xValue.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant:-1).isActive = true
        xValue.heightAnchor.constraint(equalToConstant: 26).isActive = true
        xValue.rightAnchor.constraint(equalTo: view.rightAnchor,constant:-70).isActive = true
        
        
        // Repeat Button
        Repeatbutton.translatesAutoresizingMaskIntoConstraints              = false
        Repeatbutton.topAnchor.constraint(equalTo: segment.bottomAnchor, constant: 36).isActive = true
        Repeatbutton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        Repeatbutton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        Repeatbutton.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 16).isActive = true
        Repeatbutton.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -16).isActive = true
        
        
        // Meds Type Title
        MedsType.translatesAutoresizingMaskIntoConstraints              = false
        MedsType.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        MedsType.heightAnchor.constraint(equalToConstant: 20).isActive = true
        MedsType.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 18).isActive = true
        MedsType.bottomAnchor.constraint(equalTo: segment.topAnchor, constant: -15).isActive = true
        
        // Meds Name Title
        MedsName.translatesAutoresizingMaskIntoConstraints              = false
        MedsName.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        MedsName.heightAnchor.constraint(equalToConstant: 26).isActive = true
        MedsName.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 20).isActive = true
        MedsName.topAnchor.constraint(equalTo: view.topAnchor, constant: 90).isActive = true
    
        
        // Meds Text Feild

        MedsTextField.translatesAutoresizingMaskIntoConstraints              = false
        MedsTextField.heightAnchor.constraint(equalToConstant: 35).isActive = true
        MedsTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 130).isActive = true
        MedsTextField.widthAnchor.constraint(equalTo: safeArea.widthAnchor, constant: 0).isActive = true
        MedsTextField.leftAnchor.constraint(equalTo: safeArea.leftAnchor, constant: 0).isActive = true
        MedsTextField.rightAnchor.constraint(equalTo: safeArea.rightAnchor, constant: 0).isActive = true
        
        
        // How Many Times
        HowManyTimes.translatesAutoresizingMaskIntoConstraints              = false
        HowManyTimes.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant:90).isActive = true
        HowManyTimes.heightAnchor.constraint(equalToConstant: 26).isActive = true
        HowManyTimes.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 16).isActive = true
        
        
        // Segment
        segment.translatesAutoresizingMaskIntoConstraints              = false
        segment.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        segment.widthAnchor.constraint(equalToConstant: 400).isActive = true
        segment.topAnchor.constraint(equalTo: view.topAnchor, constant: 220).isActive = true
        segment.heightAnchor.constraint(equalToConstant: 40).isActive = true
        segment.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 16).isActive = true
        segment.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -16).isActive = true
        
        
        // Plus Button for Time
        PlusButtonForTime.translatesAutoresizingMaskIntoConstraints              = false
        PlusButtonForTime.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: -1).isActive = true
        PlusButtonForTime.widthAnchor.constraint(equalToConstant: 30).isActive = true
        PlusButtonForTime.heightAnchor.constraint(equalToConstant: 30).isActive = true
        PlusButtonForTime.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -16).isActive = true
        
        
        // Minus Button for Time
        MinusButtonForTime.translatesAutoresizingMaskIntoConstraints              = false
        MinusButtonForTime.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant:-1).isActive = true
        MinusButtonForTime.widthAnchor.constraint(equalToConstant: 30).isActive = true
        MinusButtonForTime.heightAnchor.constraint(equalToConstant: 30).isActive = true
        MinusButtonForTime.rightAnchor.constraint(equalTo: view.rightAnchor,constant:-100).isActive = true
        
        
        // Time Value
        yValue.translatesAutoresizingMaskIntoConstraints              = false
        yValue.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant:90).isActive = true
        yValue.heightAnchor.constraint(equalToConstant: 26).isActive = true
        yValue.rightAnchor.constraint(equalTo: view.rightAnchor,constant:-70).isActive = true
        
        
        // How Manu Pills
        Dose.translatesAutoresizingMaskIntoConstraints              = false
        Dose.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant:-1).isActive = true
        Dose.heightAnchor.constraint(equalToConstant: 26).isActive = true
        Dose.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 16).isActive = true
        
    }
    
   
    
}
