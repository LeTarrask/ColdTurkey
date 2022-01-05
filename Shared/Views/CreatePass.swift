//
//  CreatePass.swift
//  ColdTurkey
//
//  Created by tarrask on 05/01/2022.
//

import SwiftUI

struct CreatePass: View {
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var manager: PassManager
    
    @State private var service: String = ""
    @State private var login: String = ""
    @State private var password: String = ""
    @State private var releaseDate: Date = Date.now.addingTimeInterval(86400)
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section("Site/Service") {
                        TextField("Service", text: $service)
                    }
                    
                    Section("Your credentials") {
                        TextField("Login", text: $login)
                        TextField("Password", text: $password)
                    }
                    
                    DatePicker(selection: $releaseDate, in: Date()..., displayedComponents: .date) {
                                    Text("Select a release date")
                                }

                                Text("Password will be unlocked in \(releaseDate, formatter: dateFormatter)")
                }
                
                Button("Store Credentials") {
                    manager.passes.append(PassStore(id: UUID(), service: service, login: login, password: password, releaseDate: releaseDate))
                    
                    presentationMode.wrappedValue.dismiss()
                }
            }
            .navigationTitle("Create new protected password")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct CreatePass_Previews: PreviewProvider {
    static var previews: some View {
        CreatePass(manager: PassManager())
    }
}
