//
//  CharactersResponse.swift
//  MarvelPlayground
//
//  Created by Cody Miller on 5/2/21.
//

import Foundation

struct CharactersResponse: Codable {
    var code: Int
    var status: String
    var copyright: String
    var attributionText: String
    var attributionHTML: String
    var etag: String
    var data: CharacterResponseData
}

struct CharacterResponseData: Codable {
    var offset: Int
    var limit: Int
    var total: Int
    var count: Int
    var results: [Character]
}
