//
//  ContentView.swift
//  NetworkingDemo
//
//  Created by Pubudu Mihiranga on 2024-10-16.
//

import SwiftUI

struct PostDTO: Codable, Hashable {
    let userId: Int
    let postId: Int
    let title: String
    let body: String
    
    enum CodingKeys: String, CodingKey {
        case userId
        case postId = "id"
        case title
        case body
    }
}

struct ContentView: View {
    @State var postData: [PostDTO] = []
    @State var isLoading: Bool = false
    
    var body: some View {
        VStack {
            if isLoading {
                ProgressView()
                    .scaleEffect(2.0)
            } else {
                List(postData, id: \.self) { post in
                    VStack(alignment: .leading) {
                        Text(post.title)
                        Text(post.body)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
            }
            
            
        }
        .onAppear {
            Task {
                await fetchPosts()
            }
        }
    }
    
    func fetchPosts() async {
        isLoading = true
        
        // create URL
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")
        
        guard let unwrappedURL = url else {
            print("Invalid URL")
            return
        }
        
        // Initialize URL Session
        do {
            let (data, response) = try await URLSession.shared.data(from: unwrappedURL)
            
            // check if valid response
            guard let httpResponse = response as? HTTPURLResponse else {
                print("Invalid response")
                return
            }
            
            switch httpResponse.statusCode {
            case 200...300:
                let decodedData = try JSONDecoder().decode([PostDTO].self, from: data)
                postData = decodedData
                isLoading = false
            case 400:
                print("Server is not responding")
            case 500:
                print("Server is down")
            default:
                print("Something went wrong")
            }
        } catch {
            print("something went wrong \(error.localizedDescription)")
        }
    }
}

#Preview {
    ContentView()
}
