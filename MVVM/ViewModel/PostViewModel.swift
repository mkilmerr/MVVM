//
//  QuotesViewModel.swift
//  MVVM
//
//  Created by Marcos Kilmer Pereira de Aquino on 09/11/21.
//

import Foundation

class PostViewModel: NSObject {
    private var postService: PostService?
    private var posts: Array<Post>? {
        didSet {
            self.bindPostViewModelToController()
        }
    }
    
    public var bindPostViewModelToController: (() -> ()) = {}
    
    override init() {
        super.init()
        self.postService = PostService()
        self.callGetPosts()
        
    }
    
    private func callGetPosts() {
        postService?.apiToGetPosts { (posts, error) in
            if error == nil {  self.posts = posts }
        }
    }
    
    public func getPosts() -> Array<Post>? {
        return posts
    }
    
}
