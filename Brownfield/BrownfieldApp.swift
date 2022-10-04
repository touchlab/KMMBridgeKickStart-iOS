//
//  BrownfieldApp.swift
//  Brownfield
//
//  Created by Júlia Jakubcová on 30/09/2022.
//

import SwiftUI

@main
struct BrownfieldApp: App {
    
    init() {
        startKoin()
    }
    
    var body: some Scene {
        WindowGroup {
            BreedListScreen()
        }
    }
}
