//
//  welcomeVC.swift
//  SpotifyApp
//
//  Created by Nata on 05.09.2021.
//

import UIKit

class welcomeVC: UIViewController {
    
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var logInBtn: UIButton!
    @IBOutlet weak var signUpBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: (UIImage(named: "beyonceLion"))!)
        logo.image = UIImage(named: "Spotify-Logo.wine.svg")
        setUpUI()
    }
    
    // MARK: - Navigation

    @IBAction func logInBtnTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "goToSignIn", sender: nil)
    }
    
    private func setUpUI() {
        signUpBtn.layer.cornerRadius = 25.0
        logInBtn.layer.cornerRadius = 25.0
    }

}
