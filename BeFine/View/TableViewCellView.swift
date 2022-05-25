//
//  MyCellTableViewCell.swift
//  BeFine
//
//  Created by shahadmufleh on 11/03/2022.
//

import UIKit

class TableViewCell: UITableViewCell {
    var leftItem = UILabel()
    var rightItem = UIDatePicker()
    var dateFormatter: DateFormatter!
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        leftItem.text = ""
        leftItem.textColor = .white
        leftItem.frame = CGRect(x: 15, y: 0, width: 50, height: 50)
        addSubview(leftItem)
        rightItem.datePickerMode = .time
        rightItem.frame = CGRect(x: 320, y: 0, width: 95, height: 40)
        rightItem.layer.cornerRadius = 40
        rightItem.timeZone = NSTimeZone.local
        rightItem.addTarget(self, action: #selector(datePickerValueChanged), for: .valueChanged)
        self.backgroundColor = .systemGray6
        self.contentView.addSubview(rightItem)
        
    }
    func set(cellitem: cellItems){
        leftItem.text = cellitem.leftItemFromStruct
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Date Format
    @objc func datePickerValueChanged(_ sender: UIDatePicker){
        // Create date formatter
        self.dateFormatter = DateFormatter()
        // Set date format
        dateFormatter.dateStyle = .short
        dateFormatter.dateFormat = "hh:mm a"
        // Apply date format
        let selectedDate: String = dateFormatter.string(from: sender.date)
        //view.addSubview(selectedDate)
        print("Selected value \(selectedDate)")
        
    }
    
    
}
