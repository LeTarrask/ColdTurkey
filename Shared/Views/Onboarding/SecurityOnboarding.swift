//
//  SalesOnboarding.swift
//  Cold Turkey
//
//  Created by Alex Luna on 29/03/2021.
//

import SwiftUI

struct SecurityOnboarding: View {
    var body: some View {
        VStack(alignment: .center) {
            Text("🚨")
                .font(.system(size: 150))
//            Image(systemName: "drop.fill")
//                .resizable()
//                .scaledToFit()
//                .frame(width: 200, height: 150)
            Text("Your password is safely stored. Keep it that way.")
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            Text("Cold Turkey only stores the passwords on your phone. No data is transmitted anywhere. If you lose your phone, you can still reset it on the original site.")
                .font(.body)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 30)
        }
        .padding(.bottom, 70)
    }
}

struct SalesOnboarding_Previews: PreviewProvider {
    static var previews: some View {
        SecurityOnboarding()
            .previewDevice("iPhone 13")
            .previewInterfaceOrientation(.portrait)
    }
}
