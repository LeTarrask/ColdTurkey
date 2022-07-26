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
            VStack {
                Text("🚨 You saved these passwords here for a reason \n⏰ Some are redacted until a later date \n🤔 Are you really sure you need to go back to these sites?")
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 30)
                    .foregroundColor(.gray)
                List {
                    ForEach(manager.passes) { pass in
                        NavigationLink(destination: ShowCreds(store: pass)) {
                            VStack(alignment: .leading) {
                                Text(pass.service)
                                    .font(.headline)
                                Text(pass.login)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                    .onDelete(perform: removeRows )
                }
                .listStyle(InsetGroupedListStyle())
                
            }.navigationTitle("Stored Passwords")
                .navigationBarItems(trailing: NavigationLink(destination: CreatePass(manager: manager)) {
                    Text("Add Password")
                })
        }
        
        
    }
    
    func removeRows(at offsets: IndexSet) {
        manager.passes.remove(atOffsets: offsets)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let manager = PassManager()
        for i in Range(1...25) {
            let store = PassStore(id: UUID(),
                                  service: "Twitter \(i)",
                                  login: "tarrask \(i*5)",
                                  password: "ASODAJS",
                                  releaseDate: i % 2 == 0 ? Date.distantFuture : Date.distantPast)
            manager.passes.append(store)
        }
        return ContentView(manager: manager)
    }
}
