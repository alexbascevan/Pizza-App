//
//  WebPage-ViewController.swift
//  A1Bascevan-Pizza
//
//  Created by Alexander Bascevan on 2025-01-21.
//

import UIKit
import WebKit

class WebPage_ViewController: UIViewController, WKNavigationDelegate {
    
    @IBOutlet var wbPage : WKWebView!
    @IBOutlet var activity : UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let urlAddress = URL(string: "https://youtu.be/xvFZjo5PgG0?si=LyxNQIJHIGWbQk53")! //rick roll
        let url = URLRequest(url: urlAddress)
        wbPage.load(url)
        wbPage.navigationDelegate = self
    }
    
    
    //Web Page is still loading, show activity indicator
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
         activity.isHidden = false
         activity.startAnimating()
     }
     
    //Web Page is finished loading, hide activity indicator
     func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
         activity.isHidden = true
         activity.stopAnimating()
     }

  

}
