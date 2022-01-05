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
        VStack {
            Text(store.service)
            Text(store.login)
            
            if store.releaseDate < Date.now {
                Text(store.password)
            } else {
                Text("Password will be unlocked in \(store.releaseDate, formatter: dateFormatter)")
            }
        }
    }
}

//struct ShowCreds_Previews: PreviewProvider {
//    static var previews: some View {
//        ShowCreds()
//    }
//}
