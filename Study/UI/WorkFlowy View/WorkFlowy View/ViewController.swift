//
//  ViewController.swift
//  WorkFlowy View
//
//  Created by 배창범 on 2022/03/07.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet var myWebView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        LoadHtmlFile()    
    }

    func LoadHtmlFile() {
        let filepath = Bundle.main.path(forResource: "htmlView", ofType: "html")
        let myUrl = URL(fileURLWithPath: filepath!)
        let myRequest = URLRequest(url: myUrl)
        myWebView.load(myRequest)
    }
}

