//
//  BreedViewModel.swift
//  Brownfield
//
//  Created by Júlia Jakubcová on 03/10/2022.
//

import Foundation
import Combine
import BrownfieldSDK

extension BreedListScreen {
    
    @MainActor
    class BreedViewModel : ObservableObject {
        
        private let repository: BreedRepository = KotlinDependencies.shared.getBreedRepository()
        
        @Published
        var loading = false
        
        @Published
        var breeds: [Breed]?
        
        @Published
        var error: String?
        
        private var cancellables = [AnyCancellable]()
        
        init() {
            observeBreeds()
        }
        
        private func observeBreeds() {
            repository.getBreeds().collect(collector: Collector<NSArray?>(callback: { breeds in
                DispatchQueue.main.async {
                    self.breeds = breeds as? [Breed]
                }
            }), completionHandler: { error in
                self.handleError(error: error)
            })
        }
        
        func onBreedFavorite(_ breed: Breed) {
            repository.updateBreedFavorite(breed: breed, completionHandler: { error in
                self.handleError(error: error)
            })
        }
        
        func refresh() {
            loading = true
            repository.refreshBreeds(completionHandler: { error in
                self.handleError(error: error)
            })
        }
        
        private func handleError(error: Error?) {
            DispatchQueue.main.async {
                self.loading = false
                if error != nil {
                    self.error = "Unable to refresh breed list"
                }
            }
        }
    }
}
