//
//  InterfaceController.swift
//  wtt WatchKit Extension
//
//  Created by shinichi yamaguchi on 2017/10/26.
//  Copyright © 2017 shinichi yamaguchi. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity


class InterfaceController: WKInterfaceController, WCSessionDelegate {

    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        print("session")
    }

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBOutlet var Button: WKInterfaceButton!
    
    @IBAction func Click() {
        print("Click")
        
        if WCSession.isSupported() {
            let session = WCSession.default
            session.delegate = (self as WCSessionDelegate)
            session.activate()

            let contents = ["body" : "sendInteractiveMessaging"]
            
            if  session.isReachable {
                
                let contents = ["body" : "sendInteractiveMessaging"]
                
                session.sendMessage(contents, replyHandler: { (replyMessage) -> Void in
                    //iOSからのデータを受信した時の処理
                    print("receive::\replyMessage")
                }) { (error) -> Void in
                    print(error)
                }
            }
            
            do {
                try session.updateApplicationContext(contents)
            } catch {
                print("error")
            }
        }

    }
    
}
