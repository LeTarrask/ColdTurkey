//
//  FeedbackView.swift
//  ColdTurkey
//
//  Created by tarrask on 30/05/2022.
//

#if os(iOS)
import SwiftUI
import MessageUI

struct FeedbackView: View {
    @State var result: Result<MFMailComposeResult, Error>? = nil
    @State var isShowingMailView = false
    
    @State var name = ""
    @State var subject = ""
    @State var message = ""
    
    var body: some View {
        // TO DO: Send an email with your feedback about this app
        VStack {
            Text("Send a message to the developer")
                .font(.headline)
            Text("Your opinion is extremely necessary.")
                .font(.caption)
            Form {
                Section("Your name") {
                    TextField("Name", text: $name)
                }
                
                Section("Subject line") {
                    TextField("Subject", text: $subject)
                }
                
                Section("Your message") {
                    TextEditor(text: $message)
                }
            }
            
            Button(action: {
                print("tapped")
                self.isShowingMailView.toggle()
            }) {
                Text("Send email")
            }
            .disabled(!MFMailComposeViewController.canSendMail())
            .sheet(isPresented: $isShowingMailView) {
                Button(action: {
                   EmailHelper.shared.sendEmail(subject: "Cold Turkey - \(name) - \(subject)", body: subject, to: "coldturkey@tarrask.com")
                 }) {
                     Text("Send Email")
                 }
            }
        }
    }
}

struct FeedbackView_Previews: PreviewProvider {
    static var previews: some View {
        FeedbackView()
    }
}
#endif
