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
    
    static func getBase() -> String {
        return urlBy(queryParam: .none, searchKey: "")
    }
    
    static func getByName(for name: String) -> String {
        return urlBy(queryParam: .name, searchKey: name)
    }
    
    private static func urlBy(queryParam: QueryParam, searchKey: String) -> String {
        let ts = Calendar.current.component(.nanosecond, from: Date())
        let md5 = MD5(string: "\(ts)\(privateKey)\(publicKey)")
        let baseUrlAndRequiredParams = "\(baseUrl)ts=\(ts)&apikey=\(publicKey)&hash=\(md5)"
        switch queryParam {
        case .name:
            return "\(baseUrlAndRequiredParams)&name=\(searchKey)"
        default:
            return baseUrlAndRequiredParams
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
