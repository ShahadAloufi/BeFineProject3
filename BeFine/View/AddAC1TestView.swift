//
//  AddAC1Test.swift
//  BeFine
//
//  Created by shahadmufleh on 23/03/2022.
//

import UIKit
class AddAC1TestVC: UIViewController {
    let headerView = UIView()
    var times = [listTimes]()
    // table view
    private let tabelView: UITableView = {
    let table = UITableView()
    table.register(ListCell3.self, forCellReuseIdentifier: "timeCell")
    return table
    }()
    // tests type titel
       var testsType : UILabel = {
        let type = UILabel()
        type.text = "Tests Type"
        type.textAlignment = .center
        type.font = UIFont.systemFont(ofSize: 17)
        return type
    }()
    //test days titel
    let testdays : UILabel = {
        let days = UILabel()
        days.text = "How many times a year?"
        days.textAlignment = .center
        days.font = UIFont.systemFont(ofSize: 17)
        return days
        
    }()
    
    // stepper number
    let steppernum : UILabel = {
        let number = UILabel()
        number.text = "0"
        number.textAlignment = .center
        number.font = UIFont.systemFont(ofSize: 17)
        return number
    }()
    // increment and decrement button
    let incrementbutton : UIButton = {
        let plusbutton = UIButton()
        plusbutton.setTitle("+", for: .normal)
        plusbutton.layer.cornerRadius = 10
        plusbutton.setTitleColor(.white, for: .normal)
        plusbutton.backgroundColor = .systemGray5
        plusbutton.addTarget(self, action: #selector(Plus(_:)), for: .touchUpInside)
        return plusbutton
    }()
    
    let decrementbutton : UIButton = {
        let minusbutton = UIButton()
        minusbutton.setTitle("-", for: .normal)
        minusbutton.layer.cornerRadius = 10
        minusbutton.setTitleColor(.white, for: .normal)
        minusbutton.backgroundColor = .systemGray5
        minusbutton.addTarget(self, action: #selector(Minus(_:)), for: .touchUpInside)
        return minusbutton
    }()
 
    override func viewDidLoad() {
        tabelView.delegate = self
        tabelView.dataSource = self
        self.view.addSubview(headerView)
        self.view.addSubview(tabelView)
        headerView.addSubview(testsType)
        headerView.addSubview(testdays)
        headerView.addSubview(steppernum)
        headerView.addSubview(incrementbutton)
        headerView.addSubview(decrementbutton)
        setConstraints()
        
    }
  
}




extension AddAC1TestVC: UITableViewDelegate, UITableViewDataSource {
    //tableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return times.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "timeCell", for: indexPath) as! ListCell3
        let time = times[indexPath.row]
        cell.set(listTimes: time)
        return cell
    }
    
    // increment button action
    @objc func Plus(_ sender: UIStepper ) {
        guard let presentValue = Int(steppernum.text!) else { return }
        var newValue = presentValue
        if newValue <= 3 && newValue >= 0 {
            newValue += 1
            print(newValue)
            times.append(listTimes(timename: "Time", timepicker: UIDatePicker() ))
            tabelView.reloadData()
        } else{
            print("Stop")
            
        }
        steppernum.text = "\(newValue)"
        print(newValue)
    }
    //decrement button action
    @objc func Minus(_ sender: UIButton) {
        guard let presentValue = Int(steppernum.text!) else { return }
        var newValue = presentValue
        if newValue >= 1 {
            newValue -= 1
            times.removeLast()
            tabelView.reloadData()
        } else{
            print("Stop")
        }
        steppernum.text = "\(newValue)"
        print(newValue)
    }
    
    func setConstraints() {
        // header view
        headerView.backgroundColor = UIColor.systemGray6
        headerView.translatesAutoresizingMaskIntoConstraints              = false
        headerView.topAnchor.constraint(equalTo:view.topAnchor).isActive = true
        headerView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        headerView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        headerView.bottomAnchor.constraint(equalTo: tabelView.topAnchor).isActive = true
        headerView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        // table view
        tabelView.translatesAutoresizingMaskIntoConstraints              = false
        tabelView.topAnchor.constraint(equalTo: headerView.bottomAnchor).isActive = true
        tabelView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tabelView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tabelView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        // tests type titel
        testsType.translatesAutoresizingMaskIntoConstraints              = false
        testsType.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant:-290.50).isActive = true
        testsType.heightAnchor.constraint(equalToConstant: 26).isActive = true
        testsType.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 16).isActive = true
      
        //test days titel
        testdays.translatesAutoresizingMaskIntoConstraints              = false
        testdays.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant:-150).isActive = true
        testdays.heightAnchor.constraint(equalToConstant: 26).isActive = true
        testdays.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 16).isActive = true
      
        // stepper number
        steppernum.translatesAutoresizingMaskIntoConstraints              = false
        steppernum.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant:-150).isActive = true
        steppernum.heightAnchor.constraint(equalToConstant: 26).isActive = true
        steppernum.rightAnchor.constraint(equalTo: view.rightAnchor,constant:-70).isActive = true
       
        // increment button
        incrementbutton.translatesAutoresizingMaskIntoConstraints              = false
        incrementbutton.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant:-150).isActive = true
        incrementbutton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        incrementbutton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        incrementbutton.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -16).isActive = true
        
        // decrement button
        decrementbutton.translatesAutoresizingMaskIntoConstraints              = false
        decrementbutton.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant:-150).isActive = true
        decrementbutton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        decrementbutton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        decrementbutton.rightAnchor.constraint(equalTo: view.rightAnchor,constant:-100).isActive = true
        
        
    }
    
}
