//
//  ViewController.swift
//  HelloWorld
//
//  Created by 배창범 on 2022/01/19.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var lbHello: UILabel!    
    @IBOutlet var txtName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnSend(_ sender: UIButton) {
        lbHello.text = "Hello" + txtName.text!
    }
    
}

