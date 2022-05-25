//
//  HealthKitData.swift
//  BeFine
//
//  Created by shahadmufleh on 16/03/2022.
//

import UIKit
import HealthKit

class HealthKitData: UIViewController {
    let healthStore = HKHealthStore()
    let type = Set(arrayLiteral: HKObjectType.quantityType(forIdentifier: .heartRate)!)
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    func requestPermission(){
        healthStore.requestAuthorization(toShare: type, read: type){
            (success, error) in
            if !success {}
        }
        
    }
    
}





