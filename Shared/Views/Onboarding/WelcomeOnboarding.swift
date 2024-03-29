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
            Text("🔏")
                .font(.system(size: 150))
//            Image(systemName: "drop.fill")
//                .resizable()
//                .scaledToFit()
//                .frame(width: 200, height: 150)
            Text("Go Cold Turkey on social media")
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            Text("Store your social media credentials on Cold Turkey, reset them, and set a date for release. Keep yourself out of social media for the time you want.")
                .font(.body)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 30)
        }
        .padding(.bottom, 70)
    }
}

struct WelcomeOnboarding_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeOnboarding()
    }
}
