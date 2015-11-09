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
    
    @IBAction func localButtonPressed(sender: UIButton) {
        let url = NSBundle.mainBundle().URLForResource("MyTest", withExtension:"html")
        let request = NSURLRequest(URL: url!)
        self.webView.loadRequest(request)
        //hide keyboard when go pressed
        urlTextField.endEditing(true)
    }
    @IBAction func goButtonPressed(sender: AnyObject) {
        
        let text = urlTextField.text
        let url = NSURL(string: text!)
        let request = NSURLRequest(URL: url!)
        self.webView.loadRequest(request)
        //resignFirstResponder()
        
        //hide keyboard when go pressed
        urlTextField.endEditing(true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        webView.delegate = self
        urlTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        goButtonPressed(textField)
        return false
    }

    
    func webView( webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        print("should start load")
        print(request)
        if request.URL?.scheme == "local" {
            webView.stringByEvaluatingJavaScriptFromString("showAlert()")
            return false
        }
        
        if request.URL?.scheme == "script" {
            goToApple()
            //return false
        }
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
    
    
    func goToApple() {
        let appleAddress: String = "http://www.apple.com"
        let request = NSURLRequest(URL: NSURL(string: appleAddress)!)
        self.webView.loadRequest(request)
        urlTextField.text = appleAddress
        //hide keyboard when go pressed
        urlTextField.endEditing(true)
    }

}
