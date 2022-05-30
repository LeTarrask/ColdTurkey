//
//  SalesOnboarding.swift
//  Cold Turkey
//
//  Created by Alex Luna on 29/03/2021.
//

import SwiftUI

struct SalesOnboarding: View {
    var body: some View {
        VStack(alignment: .center) {
            Image(systemName: "drop.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 150)
            Text("Main headline")
                .font(.title)
                .fontWeight(.bold)
            Text("Main copy lines explaining what this app is about Main copy lines explaining what this app is about ")
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
        SalesOnboarding()
    }
}
