//
//  CustomTabelViewCellTableViewCell.swift
//  BeFine
//
//  Created by shahadmufleh on 08/03/2022.
//

import UIKit

class CustomTabelViewCellTableViewCell: UITableViewCell {
    var safeArea: UILayoutGuide!
    static let id = "CustomTabelViewCellTableViewCell"
    let dose = UILabel()
    let name = UILabel()
   
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(dose)
        contentView.addSubview(name)
        safeArea = contentView.layoutMarginsGuide
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configure(reminderDose: String, reminderName: String){
        dose.text = reminderDose
        name.text = reminderName
       
    
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        dose.text = nil
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true  //this line centres it horizantlly
        name.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 72).isActive = true
        name.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 27).isActive = true
        name.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 50).isActive = true
    
        
        dose.translatesAutoresizingMaskIntoConstraints = false
        dose.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 290).isActive = true  //this line centres it horizantlly
        dose.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 27).isActive = true
        dose.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: 10).isActive = true
        dose.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 290).isActive = true
        dose.heightAnchor.constraint(equalTo: contentView.heightAnchor, constant: -60).isActive = true
       
    }
    
}




class CustomTabelViewCellDaily: UITableViewCell {
    static let id = "DailyCell"
    let dose = UILabel()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(dose)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configure(medDose: String){
        dose.text = medDose
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        dose.text = nil
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        dose.frame = CGRect(x: 320, y: 5, width: 100, height: contentView.frame.size.height-10)
    }
    
}
class CustomTabelViewCellAC1: UITableViewCell {
    static let id = "AC1Cell"
    let dose = UILabel()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(dose)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configure(medDose: String){
        dose.text = medDose
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        dose.text = nil
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        dose.frame = CGRect(x: 320, y: 5, width: 100, height: contentView.frame.size.height-10)
    }
    
}




class CustomAC1: UITableViewCell {
    static let id = "AC2Cell"
    let dose = UILabel()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(dose)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configure(medDose: String){
        dose.text = medDose
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        dose.text = nil
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        dose.frame = CGRect(x: 320, y: 5, width: 100, height: contentView.frame.size.height-10)
    }
    
}
