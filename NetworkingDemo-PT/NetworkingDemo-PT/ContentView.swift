//
//  ContentView.swift
//  NetworkingDemo-PT
//
//  Created by Pubudu Mihiranga on 2024-10-18.
//

import SwiftUI

struct PostModel: Codable, Hashable {
    let userId: Int
    let postId: Int
    let title: String
    let body: String
    
    enum CodingKeys: String, CodingKey {
        case userId = "userId"
        case postId = "id"
        case title = "title"
        case body = "body"
    }
}

class PostViewModel: ObservableObject {
    @Published private(set) var posts: [PostModel] = []
    @Published private(set) var isLoading: Bool = false
    
    func fecthPost() async {
        isLoading = true
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")
        
        guard let unwrappedUrl = url else {
            print("Invalid URL")
            return
        }
        
        do {
            let (fecthedData, response) = try await URLSession.shared.data(from: unwrappedUrl)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                print("Invalid response")
                return
            }
            
            switch httpResponse.statusCode {
            case 200...300:
                let decodedData = try JSONDecoder().decode([PostModel].self, from: fecthedData)
                posts = decodedData
                isLoading = false
            case 400...500:
                print("Server is not responding")
            default:
                print("Something went wrong")
            }
        } catch {
            print("Something went wrong: \(error.localizedDescription)")
        }
    }
}

struct ContentView: View {
    @StateObject var viewModel = PostViewModel()
    
    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView()
                    .scaleEffect(2.0)
            } else {
                List(viewModel.posts, id: \.self) { post in
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
                await viewModel.fecthPost()
            }
        }
    }
}

#Preview {
    ContentView()
}
