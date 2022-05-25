//
//  HeaderView.swift
//  BeFine
//
//  Created by shahadmufleh on 27/03/2022.
//

import UIKit

class HeaderView: UITableViewHeaderFooterView {
    var safeArea: UILayoutGuide!
    let time: UILabel = {
    let text = UILabel()
        text.font = UIFont.systemFont(ofSize: 15)
        text.textColor = .white
        return text
    }()
    let frequency: UILabel = {
    let text = UILabel()
        text.font = UIFont.systemFont(ofSize: 15)
        text.textColor = .white
        return text
    }()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        safeArea = contentView.layoutMarginsGuide
        addCustomView()
        
        }

        required init(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        func addCustomView() {
            time.translatesAutoresizingMaskIntoConstraints = false
            frequency.translatesAutoresizingMaskIntoConstraints = false
            self.contentView.addSubview(frequency)
            frequency.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 280).isActive = true  //this line centres it horizantlly
            frequency.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6).isActive = true
            frequency.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: 40).isActive = true
            frequency.centerYAnchor.constraint(equalTo: contentView.centerYAnchor , constant: 290).isActive = true
            frequency.heightAnchor.constraint(equalTo: contentView.heightAnchor, constant: 10).isActive = true
   
}
}
