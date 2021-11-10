//
//  QuotesService.swift
//  MVVM
//
//  Created by Marcos Kilmer Pereira de Aquino on 09/11/21.
//

import Foundation

class PostService {
    private let postsPath = "https://jsonplaceholder.typicode.com/posts"
    
    public func apiToGetPosts(completion: @escaping([Post]?, Error?) -> ()) {
        guard let url = URL(string: postsPath) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response ,error) in
            if error != nil { completion(nil, error); return }
            
            guard let dataReceive = data else{ return }
            
            do {
                let posts = try JSONDecoder().decode([Post].self, from: dataReceive)
                completion(posts, nil)
            } catch {
                completion(nil, error)
            }
        }.resume()
    }
}
