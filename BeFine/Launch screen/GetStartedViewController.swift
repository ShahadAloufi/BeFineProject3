//
//  GetStartedViewController.swift
//  BeFine
//
//  Created by shahadmufleh on 16/03/2022.
//

import UIKit

class GetStartedViewController: UIViewController {
    private let backGround: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 450, height: 960))
        imageView.image = UIImage.init(named: "Image")
        return imageView
    }()
    let getStartedButton: UIButton = {
    let button = UIButton()
        button.setTitle("Get Started", for: .normal)
        button.backgroundColor = UIColor(red: 0.314, green: 0.624, blue: 0.71, alpha: 1)
        button.layer.cornerRadius = 20
        button.frame = CGRect(x: 68, y: 729, width: 300, height: 50)
        button.addTarget(self, action: #selector(signInAction), for: .touchUpInside)
        return button
    }()
    private let logo: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 20, y: 300, width: 400, height: 400))
        imageView.image = UIImage.init(named: "Image-1")
        return imageView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(backGround)
        view.addSubview(getStartedButton)
        view.addSubview(logo)
    }
    
    @objc func signInAction(){
        let vc = SignInVC()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
   

}
