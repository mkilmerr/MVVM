//
//  ViewController.swift
//  MVVM
//
//  Created by Marcos Kilmer Pereira de Aquino on 09/11/21.
//

import UIKit

class ViewController: UIViewController {

    var postViewModel: PostViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        postViewModel = PostViewModel()
        postViewModel?.bindPostViewModelToController = {
            let test = self.postViewModel?.getPosts()
            print(test)
        }
        // Do any additional setup after loading the view.
    }


}

