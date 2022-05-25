//
//  ScheduleViewController.swift
//  BeFine
//
//  Created by shahadmufleh on 08/03/2022.
//

import UIKit
import FSCalendar
import DropDown
import WatchConnectivity
var models = [Reminders]()
var reminder = [Reminder]()
let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

class ScheduleViewController: UIViewController {
    var safeArea: UILayoutGuide!
    var session2: WCSession?
    var mainTabelView: UITableView = {
        let table = UITableView(frame: .zero, style: .insetGrouped)
        table.register(CustomTabelViewCellTableViewCell.self, forCellReuseIdentifier: CustomTabelViewCellTableViewCell.id)
        table.translatesAutoresizingMaskIntoConstraints = false
       return table

   }()
    
    let menu: DropDown = {
        let menu = DropDown()
        menu.dataSource = ["Add Mediction", "Add Test" ]
        menu.frame = CGRect(x: 0, y: 0, width: 300, height: 450)
        menu.dimmedBackgroundColor = .clear.withAlphaComponent(0.6)
        menu.cornerRadius = 10
        menu.width = 340
        menu.cellHeight = 80
        menu.backgroundColor = .systemGray6
        menu.textColor = .white
        menu.selectedTextColor = .white
        menu.selectionBackgroundColor = .clear
        menu.separatorColor = .systemGray4
        let images = [
        "pills.circle.fill",
        "drop.circle.fill"
        ]
        menu.cellNib = UINib(nibName: "DropDownCell", bundle: nil)
        menu.customCellConfiguration = {index, title, cell in
            guard let cell = cell as? MyDropDownCell else {
                return
            }
            cell.myImageView.image = UIImage(systemName: images[index])
            cell.myImageView.tintColor =  UIColor(red: 0.314, green: 0.624, blue: 0.71, alpha: 1)
        }
        return menu
    }()
    
    let menu2: DropDown = {
        let menu = DropDown()
        menu.dataSource = ["Add Mediction", "Add Test" ]
        menu.frame = CGRect(x: 0, y: 0, width: 300, height: 550)
        menu.dimmedBackgroundColor = .clear.withAlphaComponent(0.6)
        menu.direction = .bottom
        menu.cornerRadius = 15
        menu.width = 340
        menu.cellHeight = 80
        menu.backgroundColor = .systemGray6
        menu.textColor = .white
        menu.selectionBackgroundColor = .clear
        menu.selectedTextColor = .white
        menu.separatorColor = .systemGray4
        let images2 = [
        "pills.circle.fill",
        "drop.circle.fill"
        
        ]
        menu.cellNib = UINib(nibName: "DropDownCell", bundle: nil)
        menu.customCellConfiguration = {index, title, cell in
            guard let cell = cell as? MyDropDownCell else {
                return
            }
            cell.myImageView.image = UIImage(systemName: images2[index])
            cell.myImageView.tintColor =  UIColor(red: 0.314, green: 0.624, blue: 0.71, alpha: 1)
        }
        return menu
    }()
    
    var formatter = DateFormatter()
    let calendarImageView: UIImageView = {
    let imageView = UIImage.gifImageWithName("calendar")
    let imageViewF = UIImageView(image: imageView!)
        imageViewF.translatesAutoresizingMaskIntoConstraints = false
        return imageViewF
    }()

    let ManageTextView: UILabel = {
    let text = UILabel()
        text.text = "Monitor your medications and tests schedule"
        text.textAlignment = .center
        text.font = UIFont.boldSystemFont(ofSize: 15)
        text.textColor = .white
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()

    let viewText: UILabel = {
    let text = UILabel()
        text.text = "View your daily schedule and mark your meds and tests when taken"
        text.numberOfLines = 0
        text.textAlignment = .center
        text.font = UIFont.systemFont(ofSize: 15.0)
        text.textColor = .darkGray
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()

    let AddButton: UIButton = {
    let button = UIButton()
        button.setTitle("Add medication or test", for: .normal)
        button.backgroundColor = UIColor(red: 0.314, green: 0.624, blue: 0.71, alpha: 1)
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(buttonActionM), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let calendarView: FSCalendar = {
    let calendar = FSCalendar()
        calendar.scope = .week
        calendar.appearance.todayColor = UIColor(red: 0.314, green: 0.624, blue: 0.71, alpha: 1)
        calendar.appearance.titleDefaultColor = .white
        calendar.appearance.headerTitleColor = .white
        calendar.appearance.weekdayTextColor = .white
        calendar.appearance.headerTitleColor = UIColor(red: 0.314, green: 0.624, blue: 0.71, alpha: 1)
        calendar.appearance.selectionColor =  UIColor(red: 0.314, green: 0.624, blue: 0.71, alpha: 1)
        calendar.appearance.eventDefaultColor = .white
        calendar.appearance.eventSelectionColor = UIColor(red: 0.314, green: 0.624, blue: 0.71, alpha: 1)
        calendar.appearance.eventOffset = .init(x: 0.0, y: 3.0)
        calendar.swipeToChooseGesture.isEnabled = true
        calendar.weekdayHeight = 40
        calendar.headerHeight = 35
        calendar.translatesAutoresizingMaskIntoConstraints = false
        return calendar
    }()

    let buttonToday: UIButton = {
    let todayButton = UIButton()
        todayButton.setTitle("« Today", for: .normal)
        todayButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        todayButton.setTitleColor(UIColor(red: 0.314, green: 0.624, blue: 0.71, alpha: 1), for: .normal)
        todayButton.addTarget(self, action: #selector(todayItemClicked), for: .touchUpInside)
        todayButton.translatesAutoresizingMaskIntoConstraints = false
        return todayButton
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        safeArea = view.layoutMarginsGuide
        mainTabelView.delegate = self
        mainTabelView.dataSource = self
        getAllIReminders()
        calendarView.delegate = self
        calendarView.dataSource = self
        view.addSubview(mainTabelView)
        view.addSubview(calendarImageView)
        calendarImageView.isHidden = true
        view.addSubview(calendarView)
        view.addSubview(buttonToday)
        view.addSubview(ManageTextView)
        ManageTextView.isHidden = true
        view.addSubview(viewText)
        viewText.isHidden = true
        view.addSubview(AddButton)
        AddButton.isHidden = true
        mainTabelView.register(HeaderView.self,
        forHeaderFooterViewReuseIdentifier: "sectionHeader")
        setUplayOut()
        configureViews()
        SetupForWatchSession()
        notificationCenter()
    }
    
    @objc func buttonActionmenu(){
        menu.show()
       
    }
    
    func configureViews(){
        let controller3 = MedicationAddSheetView()
        let controller4 = AddTestSegment()
        let views2 = [
            controller3,
            controller4
        ]
        menu2.selectionAction = {index, title in
            self.present(UINavigationController(rootViewController: views2[index]), animated: true, completion: nil)
           
        }
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem:.add, target: self,
                                                                 action: #selector(buttonActionmenu))
        guard let topView = navigationItem.rightBarButtonItem else{
            return
        }
        menu.anchorView = topView
        let controller = MedicationAddSheetView()
        let controller2 = AddTestSegment()
   
        let views = [
            controller,
            controller2
        ]
        
        menu.selectionAction = {index, title in
            self.present(UINavigationController(rootViewController: views[index]), animated: true, completion: nil)
        }
            self.navigationItem.rightBarButtonItem?.tintColor = .white
            let barAppearance = UINavigationBarAppearance()
            barAppearance.backgroundColor = UIColor(red: 0.314, green: 0.624, blue: 0.71, alpha: 1)
            navigationItem.standardAppearance = barAppearance
            navigationItem.scrollEdgeAppearance = barAppearance
            self.title = "Schedule"
        
        
        
    }
   

    
    private func setUplayOut(){

        //image constraints
        calendarImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true  //this line centres the image horizantlly
        calendarImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        calendarImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true  //this line sets the width
        calendarImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        //today button constraints
     
        buttonToday.topAnchor.constraint(equalTo: view.topAnchor, constant: 215).isActive = true
        buttonToday.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 330).isActive = true
        buttonToday.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        
        //first text constraints
        ManageTextView.topAnchor.constraint(equalTo: calendarImageView.bottomAnchor, constant: 0).isActive = true
        ManageTextView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        ManageTextView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        ManageTextView.bottomAnchor.constraint(equalTo: calendarImageView.bottomAnchor, constant: 80).isActive = true

       // second text constraints
        viewText.topAnchor.constraint(equalTo: ManageTextView.bottomAnchor, constant: -20).isActive = true
        viewText.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        viewText.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        viewText.bottomAnchor.constraint(equalTo: ManageTextView.bottomAnchor, constant: 30).isActive = true

        //button constraints
        AddButton.widthAnchor.constraint(equalToConstant: 350).isActive = true
        AddButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        AddButton.topAnchor.constraint(equalTo: viewText.bottomAnchor, constant: 90).isActive = true
        AddButton.centerXAnchor.constraint(equalTo: viewText.centerXAnchor, constant: 0).isActive = true  //this line centres the image horizantlly
        AddButton.centerYAnchor.constraint(equalTo: viewText.centerYAnchor, constant: 80).isActive = true

        //calendar constraints
      
        calendarView.topAnchor.constraint(equalTo: view.topAnchor, constant: 90).isActive = true
        calendarView.bottomAnchor.constraint(equalTo: buttonToday.bottomAnchor, constant: 100).isActive = true
        calendarView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        calendarView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
               
        //tabel constraints
        mainTabelView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true  //this line centres the image horizantlly
        mainTabelView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        mainTabelView.topAnchor.constraint(equalTo: view.topAnchor, constant: 270).isActive = true
        mainTabelView.widthAnchor.constraint(equalTo: safeArea.widthAnchor, constant: 40).isActive = true
        mainTabelView.leftAnchor.constraint(equalTo: safeArea.leftAnchor, constant: -20).isActive = true

    }


    @objc func buttonActionM(sender: UIButton!) {
        menu2.show()

    }
   
    
    @objc
       func todayItemClicked(sender: AnyObject) {
           self.calendarView.setCurrentPage(Date(), animated: true)
          
       }
    
    
    
   


    }


extension UIBarButtonItem {

    var frame: CGRect? {
        guard let view = self.value(forKey: "view") as? UIView else {
            return nil
        }

        return view.frame
    }

}


//It is better to make conformances to protocols in the extensions and not in the definition of the class
extension ScheduleViewController: WCSessionDelegate {
    
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
          
            session2 = WCSession.default
          
            session2?.delegate = self
         
            session2?.activate()
            
        }
    }
    
    
    
    
}


//TabelView
//It is better to make conformances to protocols in the extensions and not in the definition of the class
extension ScheduleViewController: UITableViewDelegate, UITableViewDataSource {

     func numberOfSections(in tableView: UITableView) -> Int {
         if reminder.count > 0 {

                 return reminder.count
             }
             else{

                 self.calendarImageView.isHidden = false
                 self.ManageTextView.isHidden = false
                 self.viewText.isHidden = false
                 self.AddButton.isHidden = false

                 return 0
             }
         
     }
     
     func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
             return 50
         }
 
     func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
         let sectionName = reminder[section].time
         return sectionName
     }
     
     //this is my customed section where i have two titles in m y section in a horizontal view
     func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
         let view = tableView.dequeueReusableHeaderFooterView(withIdentifier:
                        "sectionHeader") as! HeaderView
         view.time.text =  reminder[section].time
         view.frequency.text = reminder[section].frequency
                 return view
     }
     
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           
         if [models].count > 0 {

                 return [models].count
             }
             else{

                 self.calendarImageView.isHidden = false
                 self.ManageTextView.isHidden = false
                 self.viewText.isHidden = false
                 self.AddButton.isHidden = false

                 return 0
             }
           
     }

     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

         let name = reminder[indexPath.section].name
         let dose = reminder[indexPath.section].dose
         let image = reminder[indexPath.section].image
         let cell = tableView.dequeueReusableCell(withIdentifier: CustomTabelViewCellTableViewCell.id, for: indexPath)
         as? CustomTabelViewCellTableViewCell
         cell?.imageView?.image = UIImage(named: image!)
         cell?.configure(reminderDose: dose!, reminderName: name!)
         return cell!
     }
     
     func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
         // this will turn on `masksToBounds` just before showing the cell
         cell.contentView.layer.masksToBounds = true
     }
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return 80.0;//Choose your custom row height
     }
     
     func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
         return .delete
     }
     
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
         let reminder = reminder[indexPath.section]
         if editingStyle == .delete {
             deleteReminder(reminder: reminder)
             getAllIReminders()
             if tableView.visibleCells.count == 0 {
                // tableView is empty. You can set a backgroundView for it.
                 self.calendarImageView.isHidden = false
                 self.ManageTextView.isHidden = false
                 self.viewText.isHidden = false
                self.AddButton.isHidden = false
             }
             
             
         }
     }
    
    
    
    //Core Data
     func getAllIReminders(){
        
        do{
            reminder = try context.fetch(Reminder.fetchRequest())
            mainTabelView.reloadData()
           
        }
        catch{
            print("fetching data did not work")
        }
        
    }
    
    func createAReminder(name: String, dose: String, frequency: String, time: String, image: String){
    let newReminder = Reminder(context: context)
        newReminder.name = name
        newReminder.dose = dose
        newReminder.frequency = frequency
        newReminder.time = time
        newReminder.image = image


    do{
        try context.save()
        
        getAllIReminders()
       
       
    }
    catch{
        print("fetching data did not work")

    }
         
         
}
    
     func deleteReminder(reminder: Reminder){
        context.delete(reminder)
        
        do{
            try context.save()
            self.getAllIReminders()
           
        }
        catch{
            print("fetching data did not work")
        }
    }
    
    
    func updateReminder(reminder: Reminder, newName: String, newDose: String, newTime: String){
         reminder.name = newName
         reminder.dose = newDose
         reminder.time = newTime

        do{
            try context.save()
            self.getAllIReminders()
        }
        catch{
            print("fetching data did not work")
        }
    }
    func notificationCenter(){
        NotificationCenter.default.addObserver(self, selector: #selector(reloadTableData), name: .reload, object: nil)
    }
    @objc func reloadTableData(_ notification: Notification) {
        self.mainTabelView.reloadData()
        self.calendarImageView.isHidden = true
        self.ManageTextView.isHidden = true
        self.viewText.isHidden = true
        self.AddButton.isHidden = true
    }
    
}


//Calendar
extension ScheduleViewController: FSCalendarDataSource, FSCalendarDelegate{
    
    func calendar(_ calendar1: FSCalendar, numberOfEventsFor date: Date) -> Int {
            let userDate = formatter.date(from: "17-03-2022")
            let userDate2 = formatter.date(from: "17-03-2022")
           // let cummultiveTestDate = formatter.date(from: "19-03-2022") //new table View
            // formatter.dateFormat = "dd-MM-yyyy"

            guard let cummultiveTestDate = formatter.date(from: "19-03-2022")  else {return 0}
            if date.compare(cummultiveTestDate) == .orderedSame {
               //tableView of cummlative test
             //   let ref = A1CTable()
                //ref.tabelView.isHidden = true
                return 1
            }
            guard let eventDate = (userDate, userDate2).1 else {return 0}
            if date.compare(eventDate) == .orderedSame {

                let ref = A1CTable()
                ref.tabelView.isHidden = true
                return 1
            }

            return 0
        }
    
    
    
        func maximumDate(for calendar1: FSCalendar) -> Date {
            return Date().addingTimeInterval((24*60*60)*100)
        }

        //MARK:- Delegate
        func calendar(_ calendar1: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
            formatter.dateFormat = "dd-MMM-yyyy"
            
            //let dateByUser = ""
            for i in 0...reminder.count{
                if formatter.dateFormat  == reminder[i].frequency{ // change frequancy to date
                print(reminder[i])

                    mainTabelView.selectRow(at: [i], animated: true, scrollPosition: .none)
                    mainTabelView.isHidden = false
            }
        }
            
            print("Date selected is \(formatter.string(from: date))")
            
        }
    func minimumDate(for calendar1: FSCalendar) -> Date {
        return Date()
    }

    
    
}
