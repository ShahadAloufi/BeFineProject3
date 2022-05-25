//
//  Repeat2.swift
//  BeFine
//
//  Created by shahadmufleh on 13/03/2022.
//

import UIKit
var day: String = ""
var userSelectedDate: [String] = []
class RepeatVC: UIViewController  {
    var safeArea: UILayoutGuide!
    var cancelButton: UIButton!
    var tableView : UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemGray5
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .singleLine
        tableView.layer.cornerRadius = 12
        return tableView
    }()

    override func viewDidLoad() {
        view.backgroundColor  = .systemGray6
        self.cancelButton = UIButton()
        cancelButton.setTitle("Back", for: .normal)
        cancelButton.setTitleColor(.systemBlue, for: .normal)
        cancelButton.frame = CGRect(x: -10, y: 1, width: 110, height: 60)
        cancelButton.addTarget(self, action: #selector(CloseAddScreen(_:)), for: .touchUpInside)
        view.addSubview(cancelButton)
        view.addSubview(tableView)
        safeArea = view.layoutMarginsGuide
        tableView.dataSource = self
        tableView.delegate = self
        setUplayOut()
        tableView.reloadData()
 
    }
     


}

//TableView
//It is better to make conformances to protocols in the extensions and not in the definition of the class
extension RepeatVC:  UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return daysArray.count
   }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default , reuseIdentifier: nil)
        cell.textLabel?.text = daysArray[indexPath.row].day
        cell.backgroundColor = .systemGray5
       return cell
   }
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       if  tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCell.AccessoryType.checkmark
       {
          tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.none
           _ = daysArray[indexPath.row].isChecked = false
      }
       else
       {
           tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.checkmark
           _ = daysArray[indexPath.row].isChecked = true
       }
   }
    
    @objc func CloseAddScreen(_ sender: UIButton){
        dismiss(animated: true, completion: nil)
        for i in 0...6{
            if daysArray[i].isChecked == true{
                print(daysArray[i].day)
                userSelectedDate.append(daysArray[i].day)
                day = " \(daysArray[i].day + " " +  day ) "
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
