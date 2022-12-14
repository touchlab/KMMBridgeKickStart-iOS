//
//  KMMBridgeKickStartIosApp.swift
//  KMMBridgeKickStartIos
//
//  Created by Júlia Jakubcová on 30/09/2022.
//

import SwiftUI
import KMMBridgeKickStart

@main
struct KMMBridgeKickStartIosApp: App {
    
    private let handle: SDKHandle
    
    init() {
        self.handle = StartSDKKt.startSDK(analytics: IosAnalytics())
        handle.appAnalytics.appStarted()
    }
    
    var body: some Scene {
        WindowGroup {
            BreedListScreen(
                viewModel: BreedViewModel(repository: handle.breedRepository, breedAnalytics: handle.breedAnalytics),
                breedAnalytics: handle.breedAnalytics
            )
        }
    }
}

class IosAnalytics: Analytics {
    func sendEvent(eventName: String, eventArgs: [String : Any]) {
        // In a real app, you would call to your analytics backend here
        print("\(eventName) - \(eventArgs)")
    }
}
