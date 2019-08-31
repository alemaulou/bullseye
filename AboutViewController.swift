//
//  AboutViewController.swift
//  BullsEye
//
//  Created by Alessandro Lou on 8/30/19.
//  Copyright © 2019 Alessandro Lou. All rights reserved.
//

import UIKit
import WebKit

class AboutViewController: UIViewController {
    
    @IBOutlet weak var webview: WKWebView!
    
    // check if file exists for error catching

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let htmlPath = Bundle.main.path(forResource: "BullsEye", ofType: "html") {
            let url =  URL(fileURLWithPath: htmlPath)
            let request = URLRequest(url: url)
            webview.load(request)
        }
    }
    
    @IBAction func close() {
        dismiss(animated: true, completion: nil)
    }
}
