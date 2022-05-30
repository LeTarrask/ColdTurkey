//
//  ColdTurkeyApp.swift
//  Shared
//
//  Created by tarrask on 05/01/2022.
//

import SwiftUI

@main
struct ColdTurkeyApp: App {
    @ObservedObject var onboardRouter: OnboardingRouter = OnboardingRouter()
    
    @State var onboarding: Bool = false
    
    var body: some Scene {
        WindowGroup {
            VStack {
                ContentView()
                    .onAppear {
                        if onboardRouter.currentPage == .onboarding {
                            onboarding.toggle()
                        }
                    }
            }
            .edgesIgnoringSafeArea(.top)
            .sheet(isPresented: $onboarding, content: {
                OnboardingView(pages: OnboardingPage.fullOnboarding)
            })
        }
    }
}
