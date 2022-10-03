//
//  BreedViewModel.swift
//  Brownfield
//
//  Created by Júlia Jakubcová on 03/10/2022.
//

import Foundation

extension BreedListScreen {
    
    @MainActor
    class BreedViewModel : ObservableObject {
        
        @Published
        var breeds: [Breed] = [
            Breed(id: 0, name: "Cute dog", favorite: true),
            Breed(id: 1, name: "Little dog", favorite: false),
            Breed(id: 2, name: "Small dog", favorite: false),
            Breed(id: 3, name: "Big dog", favorite: false),
            Breed(id: 4, name: "Epic dog", favorite: true)
        ]
        
        @Published
        var loading: Bool = false
        
        @Published
        var error: String? = nil
        
        func refresh() {
            breeds = breeds
        }
        
        func onBreedFavorite(breed: Breed) {
            // TODO
        }
    }
}

class Breed {
    
    let id: Int
    let name: String
    let favorite: Bool
    
    init(id: Int, name: String, favorite: Bool) {
        self.id = id
        self.name = name
        self.favorite = favorite
    }
}
