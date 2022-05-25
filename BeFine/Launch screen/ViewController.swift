//
//  ViewController.swift
//  BeFine
//
//  Created by shahadmufleh on 09/03/2022.
//

import UIKit
//
//class ViewController: UIViewController {
//    
//    private let imageView: UIImageView = {
//        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 500, height: 500))
//        imageView.image = UIImage.init(named: "Image-1")
//        return imageView
//    }()
//    
//    
//    override func viewDidLoad(){
//        super.viewDidLoad()
//        view.addSubview(imageView)
//        view.backgroundColor = UIColor(red: 0.70, green: 0.87, blue: 0.90, alpha: 1)
//       
//    }
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        imageView.center = view.center
//        
//
//        DispatchQueue.main.asyncAfter(deadline: .now()+0.5
//            , execute: {
//                self.animate()
//        })
//        
//    }
//    private func animate(){
//        UIView.animate(withDuration: 1, animations: {
//            let size = self.view.frame.width * 3
//            let diffX  = size - self.view.frame.size.width
//            let diffY = self.view.frame.size.height - size
//            
//            self.imageView.frame = CGRect(x: -(diffX/2), y: diffY/2, width: size, height: size)
//            self.imageView.alpha = 0
//        })
//        
//        DispatchQueue.main.asyncAfter(deadline: .now()+0.6, execute: {
//            let storyboard = UIStoryboard(name: "Main", bundle: nil)
//            let home = storyboard.instantiateViewController(withIdentifier: "ViewControllerIdentifier") as! HomeViewController
//            home.modalTransitionStyle = .crossDissolve
//            home.modalPresentationStyle = .fullScreen
//            self.present(home, animated: true)
//        })
//        
//        
//    }
//    
//}
//    
