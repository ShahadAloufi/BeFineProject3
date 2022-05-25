//
//  Repeat1.swift
//  BeFine
//
//  Created by shahadmufleh on 23/03/2022.
//

import UIKit

class RepeatVC2: UIViewController  {
    var safeArea: UILayoutGuide!
    var tableView : UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemGray5
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .singleLine
        tableView.layer.cornerRadius = 12
        return tableView
    }()
    let cancelButton: UIButton = {
    let button = UIButton()
        button.setTitle("Back", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.frame = CGRect(x: -10, y: 1, width: 110, height: 60)
        button.addTarget(self, action: #selector(CloseAddScreen(_:)), for: .touchUpInside)
        return button
    }()
    override func viewDidLoad() {
        view.backgroundColor  = .systemGray6
        view.addSubview(cancelButton)
        view.addSubview(tableView)
        safeArea = view.layoutMarginsGuide
        tableView.dataSource = self
        tableView.delegate = self
        setUplayOut()
        tableView.reloadData()
    }
  

}

extension RepeatVC2: UITableViewDelegate, UITableViewDataSource{
    //TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return daysArr.count
   }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = UITableViewCell(style: .default , reuseIdentifier: nil)
        cell.textLabel?.text = daysArr[indexPath.row].day
        cell.backgroundColor = .systemGray5
       return cell
   }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       if  tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCell.AccessoryType.checkmark
       {
          tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.none
           _ = daysArr[indexPath.row].isChecked = false
      }
       else
       {
           tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.checkmark
           _ = daysArr[indexPath.row].isChecked = true
       }
   }
    
    @objc func CloseAddScreen(_ sender: UIButton){
        dismiss(animated: true, completion: nil)
        for i in 0...6{
            if daysArr[i].isChecked == true{
                print(daysArr[i].day)
                userSelectedDate1.append(daysArr[i].day)
                testDay = " \(daysArr[i].day + " " +  testDay ) "
            }
        }
    }
    @objc func handleCancel(){
        dismiss(animated: true, completion: nil)
    }
    private func setUplayOut(){
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true  //this line centres the image horizantlly
        tableView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        tableView.leftAnchor.constraint(equalTo: safeArea.leftAnchor, constant: 0).isActive = true
        tableView.rightAnchor.constraint(equalTo: safeArea.rightAnchor , constant: 0).isActive = true
        tableView.heightAnchor.constraint(equalTo: view.heightAnchor, constant: -478).isActive = true
    
      

    }
}
