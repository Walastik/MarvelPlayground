//
//  MarvelApiBaseResponse.swift
//  MarvelPlayground
//
//  Created by Cody Miller on 5/2/21.
//

import Foundation

struct MarvelApiBaseResponse: Codable {
    var code: Int
    var status: String
    var copyright: String
    var attributionText: String
    var attributionHTML: String
    var etag: String
//    var data: MarvelData
    
//    private enum CodingKeys: String, CodingKey {
//        case code = "code"
//        case status = "status"
//        case copyright = "copyright"
//        case attributionText = "attributionText"
//        case attributionHTML = "attributionHTML"
//        case etag = "etag"
//        case data = "data"
//    }
}

//struct MarvelData: Codable {
//    var offset: Int
//    var limit: Int
//    var total: Int
//    var count: Int
//    var results: Codable
//}
