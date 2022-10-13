//
//  Koin.swift
//  Brownfield
//
//  Created by Júlia Jakubcová on 10/10/2022.
//

import Foundation
import BrownfieldSDK

func startKoin() {
    // You could just as easily define all these dependencies in Kotlin,
    // but this helps demonstrate how you might pass platform-specific
    // dependencies in a larger scale project where declaring them in
    // Kotlin is more difficult, or where they're also used in
    // iOS-specific code.

    let userDefaults = UserDefaults(suiteName: "BROWNFIELD_SETTINGS")!

    let koinApplication = KoinIOSKt.doInitKoinIos(
        userDefaults: userDefaults
    )
    _koin = koinApplication.koin
}

private var _koin: Koin_coreKoin?
var koin: Koin_coreKoin {
    return _koin!
}
