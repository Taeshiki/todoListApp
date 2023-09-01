//
//  ViewController.swift
//  todoListApp
//
//  Created by 요시킴 on 2023/08/02.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgView.image = UIImage(named: "todoImg.png")
    }

}

