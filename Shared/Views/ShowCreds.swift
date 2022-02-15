//
//  ShowCreds.swift
//  ColdTurkey
//
//  Created by tarrask on 05/01/2022.
//

import SwiftUI

struct ShowCreds: View {
    let store: PassStore
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .fill(Color.purple).opacity(0.7)
            
            VStack(alignment: .leading) {
                HStack {
                    Text("Your credentials for \(store.service)")
                        .font(.title2)
                        .fontWeight(.bold)
                }
            
                HStack {
                    Text("Login:")
                        .fontWeight(.bold)
                    Text(store.login)
                }
                
                if store.releaseDate < Date.now {
                    HStack {
                        Text("Password:")
                            .fontWeight(.bold)
                        Text(store.password)
                    }
                    
                } else {
                    VStack(alignment: .leading) {
                        Text("Password will be unlocked in \(store.releaseDate, formatter: dateFormatter)")
                            .fontWeight(.bold)
                        Text(store.password)
                            .redacted(reason: .placeholder)
                    }
                }
            }
        }
        .padding()
        .frame(height: 250)
        .navigationTitle("Cold Turkey Credential")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ShowCreds_Previews: PreviewProvider {
    static var previews: some View {
        let store = PassStore(id: UUID(), service: "Twitter", login: "tarrask", password: "ASODAJS", releaseDate: Date.distantFuture)
        return ShowCreds(store: store)
    }
}
