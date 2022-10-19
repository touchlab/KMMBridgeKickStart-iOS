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
    
    var body: some Scene {
        WindowGroup {
            BreedListScreen(viewModel: BreedViewModel(repository: serviceLocator.breedRepository))
        }
    }
}
