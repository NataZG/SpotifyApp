//
//  MusicSearchVC.swift
//  SpotifyApp
//
//  Created by Nata on 02.10.2021.
//

import UIKit
import SwiftUI


class MusicSearchVC: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    

        @IBSegueAction func swiftUIAction(_ coder: NSCoder) -> UIViewController? {

            return UIHostingController(coder: coder, rootView: ContentView())
        }

}
