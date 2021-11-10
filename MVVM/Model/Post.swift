//
//  Quotes.swift
//  MVVM
//
//  Created by Marcos Kilmer Pereira de Aquino on 09/11/21.
//

import Foundation

//struct Quotes: Decodable {
//  let author: String
//  let quote: String
//  let tags: Array<String>
//  let id: String
//  let image: String
//  let length: String
//}


struct Post: Decodable {
    let userId:Int
    let id: Int
    let title: String
    let body: String
}

