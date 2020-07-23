//
//  ViewController.swift
//  JumpingDots
//
//  Created by KM, Abhilash a on 23/07/20.
//  Copyright © 2020 abhilash. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var jumpingDotsView = DotsView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        jumpingDotsView = DotsView(frame: CGRect(x: 55,y: 0,width:  150,height:  50))

        view.addSubview(jumpingDotsView)
        jumpingDotsView.translatesAutoresizingMaskIntoConstraints = false
        jumpingDotsView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        jumpingDotsView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        jumpingDotsView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        jumpingDotsView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        jumpingDotsView.backgroundColor = .white


        view.backgroundColor = .yellow
    }

    override func viewDidAppear(_ animated: Bool) {
        jumpingDotsView.startAnimating()
    }


}

