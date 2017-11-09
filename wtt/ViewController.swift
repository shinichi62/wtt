//
//  ViewController.swift
//  wtt
//
//  Created by shinichi yamaguchi on 2017/10/26.
//  Copyright © 2017 shinichi yamaguchi. All rights reserved.
//

import UIKit
import WatchConnectivity

class ViewController: UIViewController, WCSessionDelegate {

    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        print("xxx")
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        print("xxx")
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        print("xxx")
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any], replyHandler: @escaping ([String : Any]) -> Void) {
        
        // 受信したメッセージ
        print("receiveMessage::\(message)")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var Button: UIButton!
    
    @IBAction func Click(_ sender: Any) {
        print("click iphone button")

        let contents = ["body" : "send message from iphone"]
        
        let session = WCSession.default
        session.delegate = (self as WCSessionDelegate)
        session.activate()
        
        session.sendMessage(contents, replyHandler: { (replyMessage) -> Void in
            //iOSからのデータを受信した時の処理
            print("receive::\replyMessage")
        }) { (error) -> Void in
            print(error)
        }
}
    
    

}

