//
//  NewFeatureOnboarding.swift
//  Cold Turkey
//
//  Created by Alex Luna on 29/03/2021.
//

import SwiftUI

struct HowTo: View {
    var body: some View {
        VStack(alignment: .center) {
            Text("🎉")
                .font(.system(size: 150))
//            Image(systemName: "drop.fill")
//                .resizable()
//                .scaledToFit()
//                .frame(width: 200, height: 150)
            Text("Locking yourself out of temptation is easy as 1-2-3")
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            Text("1. Create a new credential set for any site and store it on Cold Turkey until the day you chose.\n2. Reset your password, and don't let your browser remember it. (It's also good if you can't remember, either).\n3. Next time you try to check your timeline, you'll be locked out until the day you chose.")
                .font(.body)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 30)
        }
        .padding(.bottom, 70)
    }
}

struct NewFeatureOnboarding_Previews: PreviewProvider {
    static var previews: some View {
        HowTo()
    }
}
