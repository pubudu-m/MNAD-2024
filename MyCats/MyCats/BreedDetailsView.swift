//
//  BreedDetailsView.swift
//  MyCats
//
//  Created by Pubudu Mihiranga on 2024-10-23.
//

import SwiftUI

struct BreedDetailsView: View {
    @ObservedObject var viewModel: ViewModel
    let breed: Breed
    
    var body: some View {
        VStack {
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
        .padding()
    }
}

