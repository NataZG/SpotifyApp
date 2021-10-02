//
//  signInVC.swift
//  SpotifyApp
//
//  Created by Nata on 05.09.2021.
//

import UIKit
import Firebase
import SwiftUI

class signInVC: UIViewController {
    
    var ref: DatabaseReference!
    
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var logInBtn: UIButton!
    @IBOutlet weak var registerBtn: UIButton!
    @IBOutlet weak var forgotPassBtn: UIButton!
    @IBOutlet weak var warningLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: (UIImage(named: "theWeekend"))!)
        setUpUI()
        
        ref = Database.database().reference(withPath: "users")

        // если у нас еще есть действующий user то сделаем переход
        Auth.auth().addStateDidChangeListener { [weak self] _, user in
            guard let _ = user else { return }
           // self?.performSegue(withIdentifier: Constants.Segues.users, sender: nil)
        }
    }
    
    @IBSegueAction func swiftUIAction(_ coder: NSCoder) -> UIViewController? {
        
        return UIHostingController(coder: coder, rootView: ContentView())
    }
    
    override func viewWillAppear(_ animated: Bool) {
        emailTF.text = ""
        passwordTF.text = ""
    }
    

    @IBAction func logInBtnTapped(_ sender: UIButton) {
        // проверяем все поля
        guard let email = emailTF.text, let password = passwordTF.text, email != "", password != "" else {
            // показываем уникальный error
            displayWarningLabel(withText: "Info is incorrect")
            return
        }
            
        // логинемся
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] user, error in
            if let _ = error {
                self?.displayWarningLabel(withText: "Error ocured")
            } else if let _ = user {
                // переходим на новый экран
                self?.performSegue(withIdentifier: Constants.Segues.users, sender: nil)
                return
            } else {
                self?.displayWarningLabel(withText: "No such user")
            }
        }
    }
    
    
    @IBAction func registerBtnTapped(_ sender: UIButton) {
        // проверяем все поля
        guard let email = emailTF.text, let password = passwordTF.text, email != "", password != "" else {
            displayWarningLabel(withText: "Info is incorrect")
            return
        }

        // createUser
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] user, error in
            if let error = error {
                self?.displayWarningLabel(withText: "Registration was incorrect\n\(error.localizedDescription)")
            } else {
                guard let user = user else { return }
                let userRef = self?.ref.child(user.user.uid)
                userRef?.setValue(["email": user.user.email])
            }
        }
    }
    private func setUpUI() {
        logInBtn.layer.cornerRadius = 25.0
        registerBtn.layer.cornerRadius = 25.0
    }
    
    private func displayWarningLabel(withText text: String) {
        warningLbl.text = text
        // curveEaseInOut - плавно появляется и плавно исчезает
        UIView.animate(withDuration: 3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut, animations: { [weak self] in self?.warningLbl.alpha = 1 }) { [weak self] _ in
            self?.warningLbl.alpha = 0
        }
    }

}
