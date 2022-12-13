//
//  BreedViewModel.swift
//  KMMBridgeKickStartIos
//
//  Created by Júlia Jakubcová on 03/10/2022.
//

import Foundation
import Combine
import KMMBridgeKickStart
    
@MainActor
class BreedViewModel : ObservableObject {
    
    private let repository: BreedsCallbackBreedRepository
    private let breedAnalytics: BreedAnalytics
    
    @Published
    var loading = false
    
    @Published
    private var breedModels: [BreedsBreed]?
    
    @Published
    var breeds: [Breed]?
    
    @Published
    var error: String?
    
    private var cancellables = [AnyCancellable]()
    
    init(repository: BreedsCallbackBreedRepository, breedAnalytics: BreedAnalytics) {
        self.repository = repository
        self.breedAnalytics = breedAnalytics
        observeBreeds()
        repository.refreshBreedsIfStale()
    }
    
    private func observeBreeds() {
        repository.getBreeds(callback: { breeds in
            DispatchQueue.main.async {
                self.breedModels = breeds
                self.breeds = breeds.map { Breed(breed: $0) }
                self.loading = false
            }
        })
    }
    
    func onBreedFavorite(_ breed: Breed) {
        if let breedModel = breedModels?.first(where: { $0.id == breed.id }) {
            repository.updateBreedFavorite(breed: breedModel)
        } else {
            fatalError("Breed \(breed) not found.")
        }
    }
    
    func refresh() {
        loading = true
        breedAnalytics.refreshingBreeds()
        repository.refreshBreeds()
    }
}
