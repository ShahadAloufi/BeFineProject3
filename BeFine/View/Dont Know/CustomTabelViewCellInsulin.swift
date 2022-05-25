//
//  CustomTabelViewCellInsulin.swift
//  BeFine
//
//  Created by shahadmufleh on 14/03/2022.
//

import UIKit

class CustomTabelViewCellInsulin: UITableViewCell {
    static let id = "InsulinCell"
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
class CustomTabelViewCellIPills: UITableViewCell {
    static let id = "PillsCell"
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

class CustomTabelViewCellForMeds: UITableViewCell {
    static let id = "MedsCell"
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
