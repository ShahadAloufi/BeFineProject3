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
        return table

    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
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
        view.addSubview(tabelView)
    }


}


