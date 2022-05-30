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
        VStack(alignment: .leading) {
            HStack {
                Text("Your \(store.service) credentials")
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
                        .textSelection(.enabled)
                }
                
            } else {
                VStack(alignment: .leading) {
                    HStack {
                        Text("Password:")
                            .fontWeight(.bold)
                        Text(store.password)
                            .redacted(reason: .placeholder)
                    }
                    Text("This password will be unlocked in \(store.releaseDate, formatter: dateFormatter)")
                        .fontWeight(.bold)
                    
                }
            }
        }
    }
}

struct ShowCreds_Previews: PreviewProvider {
    static var previews: some View {
        let store = PassStore(id: UUID(), service: "Twitter", login: "tarrask", password: "ASODAJS", releaseDate: Date.distantFuture)
        return ShowCreds(store: store)
    }
}
