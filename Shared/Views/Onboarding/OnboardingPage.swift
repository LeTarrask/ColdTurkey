//
//  OnboardingPage.swift
//  Cold Turkey
//
//  Created by Alex Luna on 25/03/2021.
//

import SwiftUI

enum OnboardingPage: CaseIterable {
     case welcome
     case howTo
//     case permissions
     case securityOnboarding

     static let fullOnboarding = OnboardingPage.allCases

    var shouldShowNextButton: Bool {
         switch self {
         case .welcome, .howTo:
             return true
         default:
             return false
         }
     }

    var shouldShowDismissButton: Bool {
         switch self {
         case .securityOnboarding:
             return true
         default:
             return false
         }
     }

     @ViewBuilder
     func view(action: @escaping () -> Void) -> some View {
         switch self {
         case .welcome:
             WelcomeOnboarding()
         case .howTo:
             HowTo()
//         case .permissions:
//             VStack {
//                 Text("We need permissions")
//
//                 // This button should only be enabled once permissions are set:
//                 Button(action: action, label: {
//                     Text("Continue")
//                 })
//             }
         case .securityOnboarding:
             SecurityOnboarding()
         }
     }
 }
