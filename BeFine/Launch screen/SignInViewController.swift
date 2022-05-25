//
//  SignInViewController.swift
//  BeFine
//
//  Created by shahadmufleh on 09/03/2022.
//

import UIKit

class SignInViewController: UIViewController {
    //but first create the get started page
    

    //background blue
    //button create an acc
    //button sigin in with apple id

    var permission = HealthKitData()
   

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    
    @IBAction func SignInWithAppleID(_ sender: UIButton) {
        //add sign in
        permission.requestPermission()
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
