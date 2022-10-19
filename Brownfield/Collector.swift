//
//  Collector.swift
//  Brownfield
//
//  Created by Júlia Jakubcová on 10/10/2022.
//

import Foundation
import allshared

class Collector<T>: Kotlinx_coroutines_coreFlowCollector {

    let callback:(T) -> Void

    init(callback: @escaping (T) -> Void) {
        self.callback = callback
    }
    
    func emit(value: Any?, completionHandler: @escaping (Error?) -> Void) {
        callback(value as! T)
        completionHandler(nil)
    }
}
