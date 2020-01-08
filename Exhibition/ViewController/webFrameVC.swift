//
//  webFrameVC.swift
//  Exhibition
//
//  Created by Farido on 6/16/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit
import WebKit

class webFrameVC: UIViewController {
    @IBOutlet weak var webView: WKWebView!
    var x = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //videoTitelLbl.text = ultrasData.videoTitel
    
        let newString = x.replacingOccurrences(of: "600", with: "\(webView.frame.width)")
        let newString2 = newString.replacingOccurrences(of: "450", with: "\(webView.frame.height)")
        
        webView.loadHTMLString(newString2, baseURL: nil)
        
    }
}
