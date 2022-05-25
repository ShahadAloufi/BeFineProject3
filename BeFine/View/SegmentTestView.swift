//
//  SegmentTest.swift
//  BeFine
//
//  Created by shahadmufleh on 14/03/2022.
//

import UIKit

class SegmentTest: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let daily = DailyTestTable()
    let Ac1 = A1CTable()
    var segment: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        addDailyChildVC()
        addAC1ChildVC()
        Ac1.view.isHidden = false
        daily.view.isHidden = false
        self.segment = UISegmentedControl(items: [ReminderTypeStyle.upcoming.name, ReminderTypeStyle.past.name ])
        segment.selectedSegmentIndex = 0
        segment.frame = CGRect (x: 10, y: 150, width: 400, height: 40)
        segment.selectedSegmentTintColor = UIColor(red: 0.314, green: 0.624, blue: 0.71, alpha: 1)
        segment.addTarget(self, action: #selector(typetest(_:)), for: .valueChanged)
        view.addSubview(segment)
                                  
    }
    
    @objc func typetest(_ segment: UISegmentedControl) {
        daily.view.isHidden = true
        Ac1.view.isHidden = true
        if segment.selectedSegmentIndex == 0 {
            daily.view.isHidden = false
            
        }
        else{
            Ac1.view.isHidden = false
        }

        }
    
    func addDailyChildVC(){
        addChild(daily)
        view.addSubview(daily.view)
        //u can pass data here
        daily.didMove(toParent: self)
        setUpDailyConstraints()
    }
    
    func setUpDailyConstraints(){
        
    }

    func addAC1ChildVC(){
        addChild(Ac1)
        view.addSubview(Ac1.view)
        //u can pass data here
        Ac1.didMove(toParent: self)
        setUpAC1Constraints()
    }
    
    func setUpAC1Constraints(){
        
    }
    //tableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return reminder.count
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
          
        return [models].count
          
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
       // let reminder = reminder[indexPath.section]
        if editingStyle == .delete {
            //deleteReminder(reminder: reminder)
            //getAllIReminders()
            
        }
    }
   
}
