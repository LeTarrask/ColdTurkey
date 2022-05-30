//
//  WelcomeOnboarding.swift
//  Cold Turkey
//
//  Created by Alex Luna on 29/03/2021.
//

import SwiftUI

struct WelcomeOnboarding: View {
    var body: some View {
        VStack(alignment: .center) {
            Image(systemName: "drop.fill")
                .resizable()
                .frame(width: 200, height: 300)
            Text("Main headline")
                .font(.title)
                .fontWeight(.bold)
            Text("Main headline")
                .font(.body)
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 30)
                .padding(.top, 5)
        }
    }
}

struct WelcomeOnboarding_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeOnboarding()
    }
}
