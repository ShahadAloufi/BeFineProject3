//
//  SegmentMedViewController.swift
//  BeFine
//
//  Created by shahadmufleh on 14/03/2022.
//

import UIKit

class PillsTable: UIViewController  {
    var reminders = [ Reminders
    ]()
    private let tabelView: UITableView = {
        let table = UITableView(frame: CGRect(x: 0, y: 190, width: 430, height: 400 ), style: .insetGrouped)
        table.register(CustomTabelViewCellIPills.self, forCellReuseIdentifier: CustomTabelViewCellIPills.id)
       // table.translatesAutoresizingMaskIntoConstraints = false
        return table

    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
//        tabelView.delegate = self
//        tabelView.dataSource = self
        view.addSubview(tabelView)
    }
    
    //TabelView
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
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))
//                let label = UILabel()
//                let label2 = UILabel()
//                label.frame = CGRect.init(x: 5, y: 10, width: headerView.frame.width-15, height: headerView.frame.height-5)
//                label2.frame = CGRect.init(x: 320, y: 10, width: headerView.frame.width-15, height: headerView.frame.height-5)
//                label.text =  reminders[section].type[0].time
//                label2.text = reminders[section].type[0].frequency
//                label2.textColor = .white
//                label2.font = .boldSystemFont(ofSize: 18)
//                label.font = .boldSystemFont(ofSize: 18)
//                label.textColor = .white
//                headerView.addSubview(label)
//                headerView.addSubview(label2)
//                return headerView
//    }

    //height for my customed section
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//            return 50
//        }
//
//    //number of rows in a single section
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//            return reminders[section].type.count
//    }
//
//    //section title
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        let sectionName = reminders[section].type[0].time
//        return sectionName
//    }
//    //row content
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let name = reminders[indexPath.section].type[indexPath.row].name
//        let dose = reminders[indexPath.section].type[indexPath.row].dose
//        let image = reminders[indexPath.section].type[indexPath.row].symbolName
//        let cell = tabelView.dequeueReusableCell(withIdentifier: CustomTabelViewCellIPills.id, for: indexPath)
//        as? CustomTabelViewCellIPills
//        cell?.textLabel?.text = name
//        cell?.imageView?.image = UIImage(named: image)
//        cell?.configure(medDose: dose)
////        setUplayOut()
//        return cell!
//    }
}



class InsulinTable: UIViewController {
    var reminders1 = [ Reminders
    ]()

    private let tabelView: UITableView = {
        let table = UITableView(frame: CGRect(x: 0, y: 190, width: 430, height: 400 ), style: .insetGrouped)
        table.register(CustomTabelViewCellInsulin.self, forCellReuseIdentifier: CustomTabelViewCellInsulin.id)
        //table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
//        tabelView.delegate = self
//        tabelView.dataSource = self
        view.addSubview(tabelView)
    }

//    //TabelView
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return reminders1.count
//    }
//
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        // this will turn on `masksToBounds` just before showing the cell
//        cell.contentView.layer.masksToBounds = true
//    }
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 80.0;//Choose your custom row height
//    }
//
//    //this is my customed section where i have two titles in m y section in a horizontal view
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))
//                let label = UILabel()
//                let label2 = UILabel()
//                label.frame = CGRect.init(x: 5, y: 10, width: headerView.frame.width-15, height: headerView.frame.height-5)
//                label2.frame = CGRect.init(x: 320, y: 10, width: headerView.frame.width-15, height: headerView.frame.height-5)
//                label.text =  reminders1[section].type[0].time
//                label2.text = reminders1[section].type[0].frequency
//                label2.textColor = .white
//                label2.font = .boldSystemFont(ofSize: 18)
//                label.font = .boldSystemFont(ofSize: 18)
//                label.textColor = .white
//                headerView.addSubview(label)
//                headerView.addSubview(label2)
////        headerView.translatesAutoresizingMaskIntoConstraints = false
////        headerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
////        headerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
////        headerView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
////        headerView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
////        headerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
////        headerView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
//                return headerView
//    }
//
//    //height for my customed section
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//            return 50
//        }
//
//    //number of rows in a single section
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//            return reminders1[section].type.count
//    }
//
//    //section title
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        let sectionName = reminders1[section].type[0].time
//        return sectionName
//    }
//    //row content 
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let name = reminders1[indexPath.section].type[indexPath.row].name
//        let dose = reminders1[indexPath.section].type[indexPath.row].dose
//        let image = reminders1[indexPath.section].type[indexPath.row].symbolName
//        let cell = tabelView.dequeueReusableCell(withIdentifier: CustomTabelViewCellInsulin.id, for: indexPath)
//        as? CustomTabelViewCellInsulin
//        cell?.textLabel?.text = name
//        cell?.imageView?.image = UIImage(named: image)
//        cell?.configure(medDose: dose)
////        setUplayOut()
//        return cell!
//    }
}



//add action of adding to a table view
