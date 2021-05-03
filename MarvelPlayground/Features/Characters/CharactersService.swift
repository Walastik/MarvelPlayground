//
//  CharactersService.swift
//  MarvelPlayground
//
//  Created by Cody Miller on 5/2/21.
//

import Foundation

struct CharactersService {
    
    static var baseUrl: String {
        return "https://gateway.marvel.com/v1/public/characters?"
    }
    
    static func searchUrl() -> String {
        return urlBy(queryParam: .none, searchKey: "")
    }
    
    static func nameSearchUrl(for name: String) -> String {
        return urlBy(queryParam: .name, searchKey: name)
    }
    
    private static func urlBy(queryParam: QueryParam, searchKey: String) -> String {
        let ts = Calendar.current.component(.nanosecond, from: Date())
        let md5 = MD5(string: "\(ts)\(privateKey)\(publicKey)")
        switch queryParam {
        case .name:
            return "\(baseUrl)name=\(searchKey)&ts=\(ts)&apikey=\(publicKey)&hash=\(md5)"
        default:
            return "\(baseUrl)ts=\(ts)&apikey=\(publicKey)&hash=\(md5)"
        }
    }
    
    enum QueryParam: String {
        case name = "name"
        case none = "none"
    }
}

extension CharactersService {
    static var publicKey: String {
        return "b51ef10775ee4834d14184fb0436c57b"
    }
    
    static var privateKey: String {
        return "932e5c9fbe4a6fccfc451fbd7d81fec2c4206bac"
    }
}
