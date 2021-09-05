//
//  signInVC.swift
//  SpotifyApp
//
//  Created by Nata on 05.09.2021.
//

import UIKit

class signInVC: UIViewController {
    
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var logInBtn: UIButton!
    @IBOutlet weak var registerBtn: UIButton!
    @IBOutlet weak var forgotPassBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: (UIImage(named: "theWeekend"))!)
        setUpUI()
    }
    

    private func setUpUI() {
        logInBtn.layer.cornerRadius = 25.0
        registerBtn.layer.cornerRadius = 25.0
    }

}
