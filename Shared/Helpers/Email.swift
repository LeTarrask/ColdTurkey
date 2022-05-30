//
//  Email.swift
//  Cold Turkey
//
//  Created by Alex Luna on 30/05/2022.
//

#if os(iOS)
import SwiftUI
import MessageUI

// TO DO: implement send email https://thinkdiff.net/how-to-send-email-in-swiftui-5a9047e3442f

class EmailHelper: NSObject, MFMailComposeViewControllerDelegate {
    public static let shared = EmailHelper()
    private override init() {
        //
    }
    
    func sendEmail(subject: String, body: String, to: String){
        if !MFMailComposeViewController.canSendMail() {
            print("No mail account found")
            return
        }
        
        let picker = MFMailComposeViewController()
        
        picker.setSubject(subject)
        picker.setMessageBody(body, isHTML: true)
        picker.setToRecipients([to])
        picker.mailComposeDelegate = self
        
        EmailHelper.getRootViewController()?.present(picker, animated: true, completion: nil)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        EmailHelper.getRootViewController()?.dismiss(animated: true, completion: nil)
    }
    
    static func getRootViewController() -> UIViewController? {
        UIApplication.shared.windows.first?.rootViewController
    }
}
#endif
