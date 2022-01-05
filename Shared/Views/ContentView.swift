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
                    Text(pass.service)
                }
            }
            .navigationBarItems(trailing:
                                    NavigationLink(destination: CreatePass( manager: manager)) {
                Text("Add Password")
            }
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
