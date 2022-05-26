//
//  TestTable.swift
//  BeFine
//
//  Created by shahadmufleh on 14/03/2022.
//

import UIKit

class DailyTestTable: UIViewController {
    var reminders = [ Reminders
    ]()
    private let tabelView: UITableView = {
        let table = UITableView(frame: CGRect(x: 0, y: 190, width: 430, height: 400 ), style: .insetGrouped)
        table.register(CustomTabelViewCellInsulin.self, forCellReuseIdentifier: CustomTabelViewCellInsulin.id)
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

    //this is my customed section where i have two titles in m y section in a horizontal view depending on my data
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))

                return headerView
    }

    //height for my customed section
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 50
        }

}




class A1CTable: UIViewController {

   
    var reminders1 = [ Reminders
    ]()
    
     let tabelView: UITableView = {
        let table = UITableView(frame: CGRect(x: 0, y: 190, width: 430, height: 400 ), style: .insetGrouped)
        table.register(CustomTabelViewCellInsulin.self, forCellReuseIdentifier: CustomTabelViewCellInsulin.id)
        return table

    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground

        view.addSubview(tabelView)

    }

    //TabelView


    func numberOfSections(in tableView: UITableView) -> Int {
        return reminders1.count
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



                return headerView
    }

    //height for my customed section
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 50
        }


}



class A1CT: UIViewController {

 
    var reminders1 = [
      Reminders
    ]()
   
     let tabelView: UITableView = {
        let table = UITableView(frame: CGRect(x: 0, y: 50, width: 430, height: 400 ), style: .insetGrouped)
        table.register(CustomAC1.self, forCellReuseIdentifier: CustomAC1.id)
         let headerView1 = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 400, height: 150.0))
         headerView1.backgroundColor = UIColor.black
         table.tableHeaderView = headerView1
      
        return table

    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground

        view.addSubview(tabelView)




    }

    //TabelView


    func numberOfSections(in tableView: UITableView) -> Int {
        return reminders1.count
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


                return headerView
    }

    //height for my customed section
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 50
        }



}
