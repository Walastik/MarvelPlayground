//
//  Character.swift
//  MarvelPlayground
//
//  Created by Cody Miller on 5/2/21.
//

import Foundation

struct Character: Codable {
    var id: Int
    var name: String
    var description: String
    var modified: Date
    var thumbnail: MarvelThumbnail
    var resourceURI: String
    var comics: MarvelRelatedData
    var series: MarvelRelatedData
    var stories: MarvelRelatedData
    var events: MarvelRelatedData
    var urls: [MarvelUrlData]
}

struct MarvelThumbnail: Codable {
    var path: String
    var fileExtension: String
    
    private enum CodingKeys: String, CodingKey {
        case path = "path"
        case fileExtension = "extension"
    }
}

struct MarvelRelatedData: Codable {
    var available: Int
    var collectionURI: String
    var items: [RelatedItemData]
    var returned: Int
}

struct RelatedItemData: Codable {
    var resourceURI: String
    var name: String
    var type: String
}

struct MarvelUrlData: Codable {
    var type: String
    var url: String
}
