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
    private var breedModels: [BreedsBreed]?
    
    @Published
    var breeds: [Breed]?
    
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
        repository.refreshBreeds()
    }
}
