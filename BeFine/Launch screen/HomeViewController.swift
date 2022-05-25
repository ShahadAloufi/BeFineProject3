//
//  HomeViewController.swift
//  BeFine
//
//  Created by shahadmufleh on 09/03/2022.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var logo: UIImageView!
    
    @IBOutlet weak var Backg: UIImageView!
    
    @IBOutlet weak var GetButton: UIButton!
    
        
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GetButton.backgroundColor = UIColor(red: 0.314, green: 0.624, blue: 0.71, alpha: 1)
        GetButton.layer.cornerRadius = 20
        GetButton.frame = CGRect(x: 68, y: 729, width: 300, height: 50)
        view.addSubview(GetButton)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
