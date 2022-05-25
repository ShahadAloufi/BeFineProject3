//
//  AddDailyTest.swift
//  BeFine
//
//  Created by shahadmufleh on 23/03/2022.
//

import UIKit

class AddDailyTestVC: UIViewController {
    var x = 0
    var y = 0
    let headerView = UIView()
    var times = [listTimes]()
    // table view
    var tabelView: UITableView = {
        let table = UITableView()
        table.register(ListCell.self, forCellReuseIdentifier: "timeCell")
        return table
    }()
    // tests type titel
    var testsType : UILabel = {
        let type = UILabel()
        type.text = "Tests Type "
        type.textAlignment = .center
        type.font = UIFont.systemFont(ofSize: 17)
        return type
    }()

    
    let xValue: UILabel = {
        let xValue = UILabel()
        xValue.text = "0"
        xValue.textAlignment = .center
        xValue.font = UIFont.systemFont(ofSize: 17)
        return xValue
    }()
  
    let yValue: UILabel = {
        let yValue = UILabel()
        yValue.text = "0"
        return yValue
    }()
    
    //test days titel
    let testdays : UILabel = {
        let days = UILabel()
        days.text = "How many times a day?"
        days.textAlignment = .center
        days.font = UIFont.systemFont(ofSize: 17)
        return days
    }()
    // Repeat button
    let Repeatbutton : UIButton = {
        let button = UIButton()
        button.configuration = .tinted()
        button.configuration?.image = UIImage(systemName: "chevron.right")
        button.configuration?.baseBackgroundColor = .systemGray
        button.configuration?.imagePlacement = .trailing
        button.configuration?.cornerStyle = .medium
        button.configuration?.title = "Repeat"
        button.configuration?.imagePadding = 260
        button.tintColor = .white
        button.addTarget(self, action: #selector(RepeatButton), for: .touchUpInside)
        return button
    }()
    // stepper number
    let steppernum1 : UILabel = {
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
        plusbutton.addTarget(self, action: #selector(PillsPlus), for: .touchUpInside)
        return plusbutton
        
    }()
    
    let decrementbutton : UIButton = {
        let minusbutton = UIButton()
        minusbutton.setTitle("-", for: .normal)
        minusbutton.layer.cornerRadius = 10
        minusbutton.setTitleColor(.white, for: .normal)
        minusbutton.backgroundColor = .systemGray5
        minusbutton.addTarget(self, action: #selector(PillsMinus(_:)), for: .touchUpInside)
        return minusbutton
        
    }()
    
    override func viewDidLoad() {
        tabelView.delegate = self
        tabelView.dataSource = self
        self.view.addSubview(headerView)
        self.view.addSubview(tabelView)
        headerView.addSubview(testsType)
        headerView.addSubview(testdays)
        headerView.addSubview(Repeatbutton)
        headerView.addSubview(incrementbutton)
        headerView.addSubview(decrementbutton)
        headerView.addSubview(xValue)
        headerView.addSubview(yValue)
        setConstraints()
    }
    
}



extension AddDailyTestVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return times.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "timeCell", for: indexPath) as! ListCell
        let time = times[indexPath.row]
        cell.set(listTimes: time)
        return cell
    }
    
    // Repeat action
    @objc private  func RepeatButton() {
        let repeatVC = RepeatVC2()
        present(repeatVC, animated: true, completion: nil)
    }
    
    
    // Time increament
    @objc func TimesPlus (_ sender: UIStepper )
    {
       
        if x <= 3 && x >= 0 {
            x += 1
        } else{
            print("Stop")
        }
        xValue.text = "\(x)"
        print(x)

    }
    // Time decreament
    @objc func TimesMinus (_ sender: UIStepper )
    {
        if x >= 1 {
            x -= 1
        } else{
            print("Stop")
        }
        
        xValue.text = "\(x)"
        print(x)
    }
   
    // Dose increament
    @objc func PillsPlus () -> String
    {
        if y <= 3 && y >= 0 {
            y += 1
            times.append(listTimes(timename: "Time", timepicker: UIDatePicker() ))
            tabelView.reloadData()
        } else{
            print("Stop")
        }

        yValue.text = "\(y)"
        print(y)
        return "\(y)"
    }
   
    // Dose decreament
    @objc func PillsMinus(_ sender: UIButton)
    {
        if y >= 1 {
            
            y -= 1
            times.removeLast()
            tabelView.reloadData()
            
        } else{
            print("Stop")
        }

        yValue.text = "\(y)"
        print(y)
    }
    
    func setConstraints() {
        // header view
        headerView.backgroundColor = UIColor.systemGray6
        headerView.translatesAutoresizingMaskIntoConstraints              = false
        headerView.topAnchor.constraint(equalTo:view.topAnchor).isActive = true
        headerView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        headerView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        headerView.bottomAnchor.constraint(equalTo: tabelView.topAnchor).isActive = true
        headerView.heightAnchor.constraint(equalToConstant: 370).isActive = true
        
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
        testdays.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant:-80).isActive = true
        testdays.heightAnchor.constraint(equalToConstant: 26).isActive = true
        testdays.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 16).isActive = true
    
        // Repeat button
        Repeatbutton.translatesAutoresizingMaskIntoConstraints              = false
        Repeatbutton.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant:-150).isActive = true
        Repeatbutton.widthAnchor.constraint(equalToConstant: 400).isActive = true
        Repeatbutton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        Repeatbutton.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 16).isActive = true
        Repeatbutton.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -16).isActive = true
     
        // stepper number
        yValue.translatesAutoresizingMaskIntoConstraints              = false
        yValue.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant:-80).isActive = true
        yValue.heightAnchor.constraint(equalToConstant: 26).isActive = true
        yValue.rightAnchor.constraint(equalTo: view.rightAnchor,constant:-70).isActive = true
        

        // increment button
        incrementbutton.translatesAutoresizingMaskIntoConstraints              = false
        incrementbutton.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant:-80).isActive = true
        incrementbutton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        incrementbutton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        incrementbutton.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -16).isActive = true
        
        //decrement button
        decrementbutton.translatesAutoresizingMaskIntoConstraints              = false
        decrementbutton.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant:-80).isActive = true
        decrementbutton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        decrementbutton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        decrementbutton.rightAnchor.constraint(equalTo: view.rightAnchor,constant:-100).isActive = true
        
    }
    
    
}
