//
//  ContentView.swift
//  Shared
//
//  Created by tarrask on 05/01/2022.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var manager = PassManager()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(manager.passes) { pass in
                    NavigationLink(destination: ShowCreds(store: pass)) {
                        VStack {
                            Text(pass.service)
                                .font(.headline)
                            Text(pass.login)
                                .font(.subheadline)
                        }
                    }
                }
            }
            .navigationBarItems(trailing:
                                    NavigationLink(destination: CreatePass( manager: manager)) {
                Text("Add Password")
            })
            .navigationTitle("Cold Turkey")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let store = PassStore(id: UUID(), service: "Twitter", login: "tarrask", password: "ASODAJS", releaseDate: Date.distantFuture)
        return ContentView()
    }
}
