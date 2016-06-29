//
//  ViewController.swift
//  SimpleMail
//
//  Created by bc0067042 on 2016/06/22.
//  Copyright © 2016年 maru.ishi. All rights reserved.
//

import UIKit
import MessageUI

class ViewController: UIViewController, MFMailComposeViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if MFMailComposeViewController.canSendMail()==false {
            print("Email Send Failed")
            return
        }
        
        var mailViewController = MFMailComposeViewController()
        var toRecipients = ["toshiharu.ishimaru@gmail.com"] //Toのアドレス指定
//        var CcRecipients = ["cc@1gmail.com","Cc2@1gmail.com"] //Ccのアドレス指定
//        var BccRecipients = ["Bcc@1gmail.com","Bcc2@1gmail.com"] //Bccのアドレス指定
        
        mailViewController.mailComposeDelegate = self
        mailViewController.setSubject("メールの件名")
        mailViewController.setToRecipients(toRecipients) //Toアドレスの表示
//        mailViewController.setCcRecipients(CcRecipients) //Ccアドレスの表示
//        mailViewController.setBccRecipients(BccRecipients) //Bccアドレスの表示
        mailViewController.setMessageBody("メールの本文", isHTML: false)
        self.presentViewController(mailViewController, animated: true, completion: nil)

    }
    

    func mailComposeController(controller: MFMailComposeViewController!, didFinishWithResult result: MFMailComposeResult, error: NSError!) {
        
        switch result {
        case MFMailComposeResultCancelled:
            print("Email Send Cancelled")
            break
        case MFMailComposeResultSaved:
            print("Email Saved as a Draft")
            break
        case MFMailComposeResultSent:
            print("Email Sent Successfully")
            break
        case MFMailComposeResultFailed:
            print("Email Send Failed")
            break
        default:
            break
        }
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

