//
//  SignInVC.swift
//  BeFine
//
//  Created by shahadmufleh on 16/03/2022.
//

import UIKit
import HealthKit

class SignInVC: UIViewController {
    let createAccount: UIButton = {
    let button = UIButton()
        button.setTitle("Create Account", for: .normal)
        button.backgroundColor = UIColor(red: 0.314, green: 0.624, blue: 0.71, alpha: 1)
        button.layer.cornerRadius = 20
        button.frame = CGRect(x: 40, y: 629, width: 350, height: 50)
        return button
    }()
    private let logo: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 40, y: 150, width: 350, height: 360))
        imageView.image = UIImage.init(named: "GoDaddyStudioPage-0 8")
        return imageView
    }()
   
    let buttonSigInAppleID: UIButton = {
    let button = UIButton()
        button.setTitle("  Sign in with Apple", for: .normal)
        button.setImage(UIImage(systemName: "applelogo"), for: .normal)
        button.tintColor = .black
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 20
        button.frame = CGRect(x: 40, y: 720, width: 350, height: 50)
        button.addTarget(self, action: #selector(buttonActionForSignIn), for: .touchUpInside)
       
        return button
    }()
    var permission = HealthKitData()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(createAccount)
        view.addSubview(buttonSigInAppleID)
        view.addSubview(logo)
        view.backgroundColor = UIColor(red: 0.70, green: 0.87, blue: 0.90, alpha: 1)
    }
    
    @objc func buttonActionForSignIn(){
        //sigin permission
        //healthKit
        permission.requestPermission()
        let vc = MainTabBarViewController()
        vc.modalPresentationStyle = .fullScreen 
        self.present(vc, animated: true, completion: nil)
        
    }

}
