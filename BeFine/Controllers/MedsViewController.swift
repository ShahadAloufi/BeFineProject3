//
//  MedsViewController.swift
//  BeFine.
//
//  Created by shahadmufleh on 08/03/2022.
//

import UIKit
class MedsViewController: UIViewController{
    var reminders = [Reminder]()
    let segmentMeds = SegmentForMeds()
    let pillsGif: UIImageView = {
    let imageView = UIImage.gifImageWithName("pills")
    let imageViewF = UIImageView(image: imageView!)
        imageViewF.translatesAutoresizingMaskIntoConstraints = false
        return imageViewF
    }()
    var tabelView: UITableView = {
        let table = UITableView(frame: CGRect(x: 0, y: 190, width: 430, height: 400 ), style: .insetGrouped)
        table.register(CustomTabelViewCellTableViewCell.self, forCellReuseIdentifier: CustomTabelViewCellTableViewCell.id)
       return table

   }()
    let ManageTextView: UILabel = {
    let text = UILabel()
        text.text = "Manage your medications"
        text.textAlignment = .center
        text.font = UIFont.boldSystemFont(ofSize: 15)
        text.textColor = .white
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()

    let AddTextView: UILabel = {
    let text = UILabel()
        text.text = "Add your medications to be reminded on time"
        text.numberOfLines = 0
        text.textAlignment = .center
        text.font = UIFont.systemFont(ofSize: 15.0)
        text.textColor = .darkGray
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()

    let AddMedBtton: UIButton = {
    let button = UIButton()
        button.setTitle("Add medication", for: .normal)
        button.backgroundColor = UIColor(red: 0.314, green: 0.624, blue: 0.71, alpha: 1)
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(tabelView)
        view.addSubview(pillsGif)
        view.addSubview(ManageTextView)
        view.addSubview(AddTextView)
        view.addSubview(AddMedBtton)
        tabelView.delegate = self
        tabelView.dataSource = self
        setUplayOut()
        configureView()
//        addChild(segmentMeds)
//        self.view.addSubview(segmentMeds.view)

    }
    
    func configureView(){
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem:.add, target: self, action: #selector(medsAddButton))
        self.navigationItem.rightBarButtonItem?.tintColor = .white
        self.title = "Medications"
        let barAppearance = UINavigationBarAppearance()
            barAppearance.backgroundColor = UIColor(red: 0.314, green: 0.624, blue: 0.71, alpha: 1)
            navigationItem.standardAppearance = barAppearance
            navigationItem.scrollEdgeAppearance = barAppearance
    }
    @objc func buttonAction(sender: UIButton!) {
        self.present(UINavigationController(rootViewController: MedicationAddSheetView()), animated: true, completion: nil)
       
     }
    @objc func medsAddButton(){
        self.present(UINavigationController(rootViewController: MedicationAddSheetView()), animated: true, completion: nil)
        
    }

    private func setUplayOut(){

       // image constraints
        pillsGif.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 30).isActive = true  //this line centres the image horizantlly
        pillsGif.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        pillsGif.widthAnchor.constraint(equalToConstant: 150).isActive = true  //this line sets the width
        pillsGif.heightAnchor.constraint(equalToConstant: 150).isActive = true

    //    first text constraints
        ManageTextView.topAnchor.constraint(equalTo: pillsGif.bottomAnchor, constant: 0).isActive = true
        ManageTextView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        ManageTextView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        ManageTextView.bottomAnchor.constraint(equalTo: pillsGif.bottomAnchor, constant: 80).isActive = true

     //   second text constraints
        AddTextView.topAnchor.constraint(equalTo: ManageTextView.bottomAnchor, constant: -20).isActive = true
        AddTextView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        AddTextView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        AddTextView.bottomAnchor.constraint(equalTo: ManageTextView.bottomAnchor, constant: 30).isActive = true

 //       button constraints
        AddMedBtton.widthAnchor.constraint(equalToConstant: 350).isActive = true
        AddMedBtton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        AddMedBtton.topAnchor.constraint(equalTo: AddTextView.bottomAnchor, constant: 90).isActive = true
        AddMedBtton.centerXAnchor.constraint(equalTo: AddTextView.centerXAnchor, constant: 0).isActive = true  //this line centres the image horizantlly
        AddMedBtton.centerYAnchor.constraint(equalTo: AddTextView.centerYAnchor, constant: 80).isActive = true

    }
}


//TabelView
extension MedsViewController:  UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return reminders.count
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // this will turn on `masksToBounds` just before showing the cell
        cell.contentView.layer.masksToBounds = true
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0;//Choose your custom row height
    }

    //this is my customed section where i have two titles in m y section in a horizontal view
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))

                let label = UILabel()
                let label2 = UILabel()
                label.frame = CGRect.init(x: 5, y: 10, width: headerView.frame.width-15, height: headerView.frame.height-5)
                label2.frame = CGRect.init(x: 290, y: 10, width: headerView.frame.width-15, height: headerView.frame.height-5)
                label.text =  reminders[section].name
                label2.text = reminders[section].dose
                label2.textColor = .white
                label2.font = .boldSystemFont(ofSize: 18)
                label.font = .boldSystemFont(ofSize: 18)
                label.textColor = .white
                headerView.addSubview(label)
                headerView.addSubview(label2)

//        headerView.translatesAutoresizingMaskIntoConstraints = false
//        headerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        headerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//        headerView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
//        headerView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
//        headerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
//        headerView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true


                return headerView
    }

    //height for my customed section
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 50
        }

    //number of rows in a single section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return [models].count


    }

    //section title
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sectionName = reminders[section].time

        return sectionName
    }
    
    //row content
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let name = reminders[indexPath.section].name
        let dose = reminders[indexPath.section].dose
        let image = reminders[indexPath.section].image
        let cell = tabelView.dequeueReusableCell(withIdentifier: CustomTabelViewCellTableViewCell.id, for: indexPath)
        as? CustomTabelViewCellTableViewCell
        cell?.textLabel?.text = name
        cell?.imageView?.image = UIImage(named: image!)
        cell?.configure(reminderDose: dose!, reminderName: name!)
        setUplayOut()
        return cell!


    }
    
    
}
