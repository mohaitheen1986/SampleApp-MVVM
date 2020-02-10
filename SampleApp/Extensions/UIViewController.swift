//
//  UIViewController.swift
//  SampleApp
//
//  Created by Mohaitheen on 10/02/20.
//  Copyright © 2020 Mohaitheen. All rights reserved.
//

import UIKit
import MessageUI

extension UIViewController {
    
    func sendEmail(recipients : [String]?, subject :
        String, body : String, isHtml : Bool = false,
                images : [UIImage]?) {
        if (MFMailComposeViewController.canSendMail()) {
            let mailComposerVC = MFMailComposeViewController()
            mailComposerVC.setToRecipients(recipients)
            mailComposerVC.setSubject(subject)
            mailComposerVC.setMessageBody(body, isHTML: isHtml)
            
            present(mailComposerVC, animated: true, completion: nil)
        } else {
            print("this device cannot send email")
        }
        
       
    }
    
    func callToPhone(phone: String?) {
        if let phoneCallURL:URL = URL(string: "tel:\(phone ?? "")") {
            let application:UIApplication = UIApplication.shared
            if (application.canOpenURL(phoneCallURL)) {
                application.open(phoneCallURL, options: [:], completionHandler: nil)

            }
        }
    }

}
