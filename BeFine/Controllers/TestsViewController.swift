//
//  TestsViewController.swift
//  BeFine
//
//  Created by shahadmufleh on 08/03/2022.
//

import UIKit
class TestsViewController: UIViewController {
    var models = [Reminders]()
    var reminder2 = [Reminder]()
    let testSegment = SegmentTest()
    let vc = ScheduleViewController()
    var safeArea: UILayoutGuide!
    var testTabelView: UITableView = {
        let table = UITableView(frame: .zero, style: .insetGrouped)
        table.register(CustomTabelViewCellTableViewCell.self, forCellReuseIdentifier: CustomTabelViewCellTableViewCell.id)
        table.translatesAutoresizingMaskIntoConstraints = false
       return table
   }()
    let testGif: UIImageView = {
    let imageView = UIImage.gifImageWithName("test")
    let imageViewF = UIImageView(image: imageView!)
        imageViewF.translatesAutoresizingMaskIntoConstraints = false
        return imageViewF
    }()

    let ManageText: UILabel = {
    let text = UILabel()
        text.text = "Manage your tests"
        text.textAlignment = .center
        text.font = UIFont.boldSystemFont(ofSize: 15)
        text.textColor = .white
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()

    let addText: UILabel = {
    let text = UILabel()
        text.text = "Add your tests to be reminded on time"
        text.numberOfLines = 0
        text.textAlignment = .center
        text.font = UIFont.systemFont(ofSize: 15.0)
        text.textColor = .darkGray
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()

    let addTestButton: UIButton = {
    let button = UIButton()
        button.setTitle("Add test", for: .normal)
        button.backgroundColor = UIColor(red: 0.314, green: 0.624, blue: 0.71, alpha: 1)
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(testGif)
        view.addSubview(ManageText)
        view.addSubview(addText)
        view.addSubview(addTestButton)
        //view.addSubview(testTabelView)
        safeArea = view.layoutMarginsGuide
//        testTabelView.delegate = self
//        testTabelView.dataSource = self
//        vc.mainTabelView.delegate = self
       // addChild(testSegment)
        //self.view.addSubview(testSegment.view)
        setUplayOut()
        configureView()
        //notificationCenter()
      
        
    }
    
   
    @objc func buttonAction(sender: UIButton!) {
        self.present(UINavigationController(rootViewController: AddTestSegment()), animated: true, completion: nil)
//        addTestButton.isHidden = true
//        testGif.isHidden = true
//        addText.isHidden = true
//        ManageText.isHidden = true
//        addTestButton.isHidden = true
       
        
        
     }
    
    func configureView(){
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem:.add, target: self, action: #selector(buttonAction))
        self.navigationItem.rightBarButtonItem?.tintColor = .white
        self.title = "Tests"
        let barAppearance = UINavigationBarAppearance()
        barAppearance.backgroundColor = UIColor(red: 0.314, green: 0.624, blue: 0.71, alpha: 1)
        navigationItem.standardAppearance = barAppearance
        navigationItem.scrollEdgeAppearance = barAppearance
    }
    
    private func setUplayOut(){
        //image constraints
        testGif.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true  //this line centres the image horizantlly
        testGif.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        testGif.widthAnchor.constraint(equalToConstant: 150).isActive = true  //this line sets the width
        testGif.heightAnchor.constraint(equalToConstant: 150).isActive = true

        //first text constraints
        ManageText.topAnchor.constraint(equalTo: testGif.bottomAnchor, constant: 0).isActive = true
        ManageText.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        ManageText.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        ManageText.bottomAnchor.constraint(equalTo: testGif.bottomAnchor, constant: 80).isActive = true

        //second text constraints
        addText.topAnchor.constraint(equalTo: ManageText.bottomAnchor, constant: -20).isActive = true
        addText.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        addText.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        addText.bottomAnchor.constraint(equalTo: ManageText.bottomAnchor, constant: 30).isActive = true

        //button constraints
        addTestButton.widthAnchor.constraint(equalToConstant: 350).isActive = true
        addTestButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        addTestButton.topAnchor.constraint(equalTo: addText.bottomAnchor, constant: 90).isActive = true
        addTestButton.centerXAnchor.constraint(equalTo: addText.centerXAnchor, constant: 0).isActive = true  //this line centres the image horizantlly
        addTestButton.centerYAnchor.constraint(equalTo: addText.centerYAnchor, constant: 80).isActive = true
        
//        testTabelView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true  //this line centres the image horizantlly
//        testTabelView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//        testTabelView.topAnchor.constraint(equalTo: view.topAnchor, constant: 270).isActive = true
//        testTabelView.widthAnchor.constraint(equalTo: safeArea.widthAnchor, constant: 40).isActive = true
//        testTabelView.leftAnchor.constraint(equalTo: safeArea.leftAnchor, constant: -20).isActive = true

    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}


//TabelView
//It is better to make conformances to protocols in the extensions and not in the definition of the class
//extension TestsViewController: UITableViewDelegate, UITableViewDataSource {
//
//     func numberOfSections(in tableView: UITableView) -> Int {
//         return reminder2.count
//     }
//
//     func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//             return 50
//         }
//
//     func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//         let sectionName = reminder2[section].time
//         return sectionName
//     }
//
//     //this is my customed section where i have two titles in m y section in a horizontal view
//     func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//         let view = tableView.dequeueReusableHeaderFooterView(withIdentifier:
//                        "sectionHeader") as! HeaderView
//         view.time.text =  reminder2[section].time
//         view.frequency.text = reminder2[section].frequency
//                 return view
//     }
//
//     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//
//         return [models].count
//
//     }
//
//     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//         let name = reminder2[indexPath.section].name
//         let dose = reminder2[indexPath.section].dose
//         let image = reminder2[indexPath.section].image
//         let cell = tableView.dequeueReusableCell(withIdentifier: CustomTabelViewCellTableViewCell.id, for: indexPath)
//         as? CustomTabelViewCellTableViewCell
//         cell?.imageView?.image = UIImage(named: image!)
//         cell?.configure(reminderDose: dose!, reminderName: name!)
//         return cell!
//     }
//
//     func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//         // this will turn on `masksToBounds` just before showing the cell
//         cell.contentView.layer.masksToBounds = true
//     }
//     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//         return 80.0;//Choose your custom row height
//     }
//
//     func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
//         return .delete
//     }
//
//     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//         let reminder = reminder2[indexPath.section]
//         if editingStyle == .delete {
//             deleteReminder(reminder: reminder)
//             getAllIReminders()
//
//         }
//     }
//
//
//
//    //Core Data
//     func getAllIReminders(){
//
//        do{
//            reminder2 = try context.fetch(Reminder.fetchRequest())
//            testTabelView.reloadData()
////            addTestButton.isHidden = true
////            testGif.isHidden = true
////            addText.isHidden = true
////            ManageText.isHidden = true
//        }
//        catch{
//            print("fetching data did not work")
//        }
//
//    }
//
//    func createAReminder(name: String, dose: String, frequency: String, time: String, image: String){
//    let newReminder = Reminder(context: context)
//        newReminder.name = name
//        newReminder.dose = dose
//        newReminder.frequency = frequency
//        newReminder.time = time
//        newReminder.image = image
//
//
//
//    do{
//        try context.save()
//
//        getAllIReminders()
//
//
//    }
//    catch{
//        print("fetching data did not work")
//
//    }
//
//
//}
//
//     func deleteReminder(reminder: Reminder){
//        context.delete(reminder)
//
//        do{
//            try context.save()
//            self.getAllIReminders()
//
//        }
//        catch{
//            print("fetching data did not work")
//        }
//    }
//
//
//    func updateReminder(reminder: Reminder, newName: String, newDose: String, newTime: String){
//         reminder.name = newName
//         reminder.dose = newDose
//         reminder.time = newTime
//
//        do{
//            try context.save()
//            self.getAllIReminders()
//        }
//        catch{
//            print("fetching data did not work")
//        }
//    }
//    func notificationCenter(){
//        NotificationCenter.default.addObserver(self, selector: #selector(reloadTableData), name: .reload, object: nil)
//    }
//    @objc func reloadTableData(_ notification: Notification) {
//        self.testTabelView.reloadData()
//    }
//
//
//
//
//
//}
//
