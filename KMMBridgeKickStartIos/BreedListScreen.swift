//
//  ContentView.swift
//  KMMBridgeKickStartIos
//
//  Created by Júlia Jakubcová on 30/09/2022.
//

import Combine
import SwiftUI
import allshared

struct BreedListScreen: View {
    
    @ObservedObject
    var viewModel: BreedViewModel
    
    let breedAnalytics: BreedAnalytics

    var body: some View {
        BreedListContent(
            breedAnalytics: breedAnalytics,
            loading: viewModel.loading,
            breeds: viewModel.breeds,
            error: viewModel.error,
            onBreedFavorite: { viewModel.onBreedFavorite($0) },
            refresh: { viewModel.refresh() }
        )
    }
}

struct BreedListContent: View {
    
    let breedAnalytics: BreedAnalytics
    var loading: Bool
    var breeds: [Breed]?
    var error: String?
    var onBreedFavorite: (Breed) -> Void
    var refresh: () -> Void

    var body: some View {
        ZStack {
            VStack {
                if let breeds = breeds {
                    List(breeds, id: \.id) { breed in
                        BreedRowView(breed: breed) {
                            onBreedFavorite(breed)
                            breedAnalytics.favoriteClicked(id: breed.id)
                        }
                    }.onAppear {
                        breedAnalytics.displayingBreeds(size: Int32(breeds.count))
                    }
                }
                if let error = error, breeds == nil {
                    Text(error)
                        .foregroundColor(.red)
                        .onAppear {
                            breedAnalytics.displayingError(message: error)
                        }
                }
                Button("Refresh") {
                    refresh()
                }
            }
            if loading { Text("Loading...") }
        }
    }
}

struct BreedRowView: View {
    var breed: Breed
    var onTap: () -> Void

    var body: some View {
        Button(action: onTap) {
            HStack {
                Text(breed.name)
                    .padding(4.0)
                Spacer()
                Image(systemName: (!breed.favorite) ? "heart" : "heart.fill")
                    .padding(4.0)
            }
        }
    }
}
