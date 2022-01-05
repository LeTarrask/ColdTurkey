//
//  ContentView.swift
//  Shared
//
//  Created by tarrask on 05/01/2022.
//

import SwiftUI

struct ContentView: View {
    let manager = PassManager()
    
    var body: some View {
        List {
            ForEach(manager.passes) { pass in
                Text(pass.service)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
