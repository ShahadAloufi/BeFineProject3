//
//  AddDailyTestCall.swift
//  BeFine
//
//  Created by shahadmufleh on 11/03/2022.
//

import UIKit
var selectedDteForTests : String = ""
class ListCell: UITableViewCell {
    var timetitleLabel = UILabel()
    var timepicker = UIDatePicker()
    var dateFormatter: DateFormatter!
    override init (style : UITableViewCell.CellStyle, reuseIdentifier reuseidentifier: String?){
        super.init(style: style, reuseIdentifier: reuseidentifier)
        addSubview(timetitleLabel)
        self.contentView.addSubview(timepicker)
        configuretimelblView()
        configuretimepickerView()
        setTimelblConstraints()
        setTtimepickerConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    func set ( listTimes :  listTimes){
        timetitleLabel.text = listTimes.timename
        
    }
    
    func configuretimelblView(){
        timetitleLabel.adjustsFontSizeToFitWidth = true
        timetitleLabel.numberOfLines = 0
    }
    
    
    
    func configuretimepickerView(){
        timepicker.datePickerMode = .time
        timepicker.preferredDatePickerStyle = .compact
        timepicker.locale = .current
    }
    
    
    
    func setTimelblConstraints(){
        timetitleLabel.translatesAutoresizingMaskIntoConstraints              = false
        timetitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        timetitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        timetitleLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        timetitleLabel.widthAnchor.constraint(equalTo: timetitleLabel.heightAnchor, multiplier: 16/9).isActive = true
    }
    
    
    func setTtimepickerConstraints(){
        timepicker.translatesAutoresizingMaskIntoConstraints              = false
        timepicker.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        timepicker.leadingAnchor.constraint(equalTo: timetitleLabel.trailingAnchor, constant: 20).isActive = true
        timepicker.heightAnchor.constraint(equalToConstant: 80).isActive = true
        timepicker.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        timepicker.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)
    }
    
    @objc func datePickerValueChanged(_ sender: UIDatePicker){
                   // Create date formatter
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.short
                self.dateFormatter = DateFormatter()
                   // Set date format
                   dateFormatter.dateStyle = .short
                   dateFormatter.dateFormat = "hh:mm a"
                   // Apply date format
        let selectedDate: String = dateFormatter.string(from: sender.date)
                   selectedDteForTests = selectedDate
                   print("Selected value \(selectedDate)")
       
               }
}
