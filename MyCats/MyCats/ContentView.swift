//
//  ContentView.swift
//  MyCats
//
//  Created by Pubudu Mihiranga on 2024-10-23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack {
            List(viewModel.breeds) { breed in
                NavigationLink {
                    BreedDetailsView(viewModel: viewModel, breed: breed)
                } label: {
                    HStack {
                        AsyncImage(url: URL(string: viewModel.createImageURL(imageId: breed.imageId))) { phase in
                            if let image = phase.image {
                                image
                                    .resizable()
                                    .frame(width: 80, height: 80)
                                    .cornerRadius(10)
                                    .scaledToFit()
                            } else if phase.error != nil {
                                Image(systemName: "cat.fill")
                                    .resizable()
                                    .frame(width: 80, height: 80)
                            } else {
                                ProgressView()
                                    .frame(width: 80, height: 80)
                            }
                        }
                        
                        VStack(alignment: .leading) {
                            Text(breed.name)
                            Text(breed.temperament)
                        }
                    }
                }
            }
            .onAppear {
                Task {
                    await viewModel.fetchCatData()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}


