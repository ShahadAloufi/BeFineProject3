//
//  SegmentForMeds.swift
//  BeFine
//
//  Created by shahadmufleh on 14/03/2022.
//

import UIKit
class SegmentForMeds: UIViewController {
    let pills = PillsTable()
    let insulin = InsulinTable()
    var segment: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        addChild(pills)
        addChild(insulin)
        self.view.addSubview(pills.view)
        self.view.addSubview(insulin.view)
        insulin.view.isHidden = true
        self.segment = UISegmentedControl(items: [ReminderTypeStyle.pills.name, ReminderTypeStyle.insulin.name ])
        segment.selectedSegmentIndex = 0
        segment.frame = CGRect (x: 10, y: 150, width: 400, height: 40)
        segment.selectedSegmentTintColor = UIColor(red: 0.314, green: 0.624, blue: 0.71, alpha: 1)
        segment.addTarget(self, action: #selector(typetest(_:)), for: .valueChanged)
       view.addSubview(segment)
    }
    
    @objc func typetest(_ segment: UISegmentedControl) {
        pills.view.isHidden = true
        insulin.view.isHidden = true
        if segment.selectedSegmentIndex == 0 {
            pills.view.isHidden = false
        }
        else{
            insulin.view.isHidden = false
        }

        }
    
    }
    
