//
//  ContentView.swift
//  Brownfield
//
//  Created by Júlia Jakubcová on 30/09/2022.
//

import Combine
import SwiftUI

struct BreedListScreen: View {
    
    @StateObject
    var viewModel = BreedViewModel()

    var body: some View {
        BreedListContent(
            loading: viewModel.loading,
            breeds: viewModel.breeds,
            error: viewModel.error,
            onBreedFavorite: { viewModel.onBreedFavorite(breed: $0) },
            refresh: { viewModel.refresh() }
        )
    }
}

struct BreedListContent: View {
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
                        }
                    }
                }
                if let error = error {
                    Text(error)
                        .foregroundColor(.red)
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

struct BreedListScreen_Previews: PreviewProvider {
    static var previews: some View {
        BreedListContent(
            loading: false,
            breeds: [
                Breed(id: 0, name: "appenzeller", favorite: false),
                Breed(id: 1, name: "australian", favorite: true)
            ],
            error: nil,
            onBreedFavorite: { _ in },
            refresh: {}
        )
    }
}

