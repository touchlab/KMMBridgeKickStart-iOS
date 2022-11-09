//
//  BreedViewModel.swift
//  KMMBridgeKickStartIos
//
//  Created by Júlia Jakubcová on 03/10/2022.
//

import Foundation
import Combine
import allshared
    
@MainActor
class BreedViewModel : ObservableObject {
    
    private let repository: BreedsCallbackBreedRepository
    
    @Published
    var loading = false
    
    @Published
    var breeds: [BreedsBreed]?
    
    @Published
    var error: String?
    
    private var cancellables = [AnyCancellable]()
    
    init(repository: BreedsCallbackBreedRepository) {
        self.repository = repository
        observeBreeds()
        repository.refreshBreedsIfStale()
    }
    
    private func observeBreeds() {
        repository.getBreeds(callback: { breeds in
            DispatchQueue.main.async {
                self.breeds = breeds
                self.loading = false
            }
        })
    }
    
    func onBreedFavorite(_ breed: BreedsBreed) {
        repository.updateBreedFavorite(breed: breed)
    }
    
    func refresh() {
        loading = true
        repository.refreshBreeds()
    }
}
