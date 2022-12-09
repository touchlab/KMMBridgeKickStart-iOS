//
//  Breed.swift
//  KMMBridgeKickStartIos
//
//  Created by Júlia Jakubcová on 10/11/2022.
//

import Foundation
import KMMBridgeKickStart

class Breed {
    
    let id: Int64
    let name: String
    let favorite: Bool
    
    init(id: Int64, name: String, favorite: Bool) {
        self.id = id
        self.name = name
        self.favorite = favorite
    }
    
    init(breed: BreedsBreed) {
        self.id = breed.id
        self.name = breed.name
        self.favorite = breed.favorite
    }
}
