//
//  ViewModel.swift
//  MyCats
//
//  Created by Pubudu Mihiranga on 2024-10-23.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var breeds: [Breed] = []
    
    func fetchCatData() async {
        guard let url = URL(string: "https://api.thecatapi.com/v1/breeds") else {
            print("Ivalid URL")
            return
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                print("Invalid response")
                return
            }
            
            guard httpResponse.statusCode == 200 else {
                print("Invalid response code")
                return
            }
            
            let decodedData = try JSONDecoder().decode([Breed].self, from: data)
            
            DispatchQueue.main.async {
                self.breeds = decodedData
            }
        } catch {
            print("Something went wrong! \(error.localizedDescription)")
        }
    }
    
    func createImageURL(imageId: String?) -> String {
        guard let imageRef = imageId else {
            print("No image reference")
            return ""
        }
        
        return "https://cdn2.thecatapi.com/images/\(imageRef).jpg"
    }
}
