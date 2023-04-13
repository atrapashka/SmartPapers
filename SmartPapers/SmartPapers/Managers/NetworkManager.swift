import Foundation

enum ObtainPostsResult {
    case success(posts: [BookResponse])
    case failure(error: Error)
}

class NetworkManager {
    
    let sessionConfigurator = URLSessionConfiguration.default
    let session = URLSession.shared
    let decoder = JSONDecoder()
    
    func obtainPosts(completion: @escaping (ObtainPostsResult) -> Void) {
        guard let url = URL(string: "https://openlibrary.org/trending/daily.json") else {
            return
        }
        
        session.dataTask(with: url) { [weak self] (data, response, error) in
            
            var result: ObtainPostsResult
            
            defer {
                DispatchQueue.main.async {
                    completion(result)
                }
            }
            
            guard let strongSelf = self else {
                result = .success(posts: [])
                return
            }
            
            if error == nil, let parsData = data {
                
                guard let posts = try?
                        strongSelf.decoder.decode([BookResponse].self, from: parsData) else {
                    result = .success(posts: [])
                    return
                }
                result = .success(posts: posts)
            }
            else {
                result = .failure(error: error!)
            }
        }.resume()
    }
}
