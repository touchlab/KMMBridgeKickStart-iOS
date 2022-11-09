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

    var body: some View {
        BreedListContent(
            loading: viewModel.loading,
            breeds: viewModel.breeds,
            error: viewModel.error,
            onBreedFavorite: { viewModel.onBreedFavorite($0) },
            refresh: { viewModel.refresh() }
        )
    }
}

struct BreedListContent: View {
    var loading: Bool
    var breeds: [BreedsBreed]?
    var error: String?
    var onBreedFavorite: (BreedsBreed) -> Void
    var refresh: () -> Void

    var body: some View {
        ZStack {
            VStack {
                if let breeds = breeds {
                    List(breeds, id: \.id) { breed in
                        BreedRowView(breed: breed) {
                            onBreedFavorite(breed)
                            BreedAnalytics().favoriteClicked(id: breed.id)
                        }
                    }.onAppear {
                        BreedAnalytics().displayingBreeds(size: Int32(breeds.count))
                    }
                }
                if let error = error, breeds == nil {
                    Text(error)
                        .foregroundColor(.red)
                        .onAppear {
                            BreedAnalytics().displayingError(message: error)
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
    var breed: BreedsBreed
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

struct BreedListScreen_Previews: PreviewProvider {
    static var previews: some View {
        BreedListContent(
            loading: false,
            breeds: [
                BreedsBreed(id: 0, name: "appenzeller", favorite: false),
                BreedsBreed(id: 1, name: "australian", favorite: true)
            ],
            error: nil,
            onBreedFavorite: { _ in },
            refresh: {}
        )
    }
}
