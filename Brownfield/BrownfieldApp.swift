//
//  BrownfieldApp.swift
//  Brownfield
//
//  Created by Júlia Jakubcová on 30/09/2022.
//

import SwiftUI
import allshared

@main
struct BrownfieldApp: App {
    
    private let serviceLocator: ServiceLocator = IOSServiceLocator(userDefaults: UserDefaults.standard)
    
    init() {
        AnalyticsKt.doInitAnalytics(analytics: IosAnalytics())
        AppAnalytics().appStarted()
    }
    
    var body: some Scene {
        WindowGroup {
            BreedListScreen(viewModel: BreedViewModel(repository: serviceLocator.breedRepository))
        }
    }
}

class IosAnalytics: Analytics {
    func sendEvent(eventName: String, eventArgs: [String : Any]) {
        print("\(eventName) - \(eventArgs)")
    }
}
