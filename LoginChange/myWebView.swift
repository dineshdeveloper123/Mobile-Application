//
//  myWebView.swift
//  LoginChange
//
//  Created by Rifluxyss on 18/09/24.
//

import UIKit
import WebKit

class myWebView: UIViewController{

    @IBOutlet var webView: WKWebView!
    @IBOutlet var indicator: UIActivityIndicatorView!
    
    var item2: UserData?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        let urlStr = "https://www.javatpoint.com/ios-development-using-swift"
        
        if let item2 = item2{
            
                
                let request = URLRequest(url: URL(string:item2.webUrl)!)
                self.webView.load(request)
                
                indicator.startAnimating()
            
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        indicator.stopAnimating()
        indicator.isHidden = true
    }

    
}
