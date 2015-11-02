//
//  ViewController.swift
//  ClassNov2
//
//  Created by Guanyi Fang on 2015-11-02.
//  Copyright © 2015 Guanyi Fang. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, UIWebViewDelegate, UITextFieldDelegate{

    @IBOutlet weak var urlTextField: UITextField!
    
    @IBOutlet weak var webView: UIWebView!
    @IBAction func goButtonPressed(sender: UIButton) {
        
        let text = urlTextField.text
        let url = NSURL(string: text!)
        print(text)
        let request = NSURLRequest(URL: url!)
        self.webView.loadRequest(request)
        
        webView.delegate = self
        //resignFirstResponder()
        
        //hide keyboard when go pressed
        urlTextField.endEditing(true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func webView( webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        print("should start load")
        return true
    }
    
    func webViewDidStartLoad( webView: UIWebView) {
        print("did start load")
    }
    
    func webViewDidFinishLoad( webView: UIWebView) {
        print("did finish load")
    }
    
    func webView( webView: UIWebView, didFailLoadWithError error: NSError?) {
        print(error)
    }

}
