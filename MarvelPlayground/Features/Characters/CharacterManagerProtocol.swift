//
//  CharacterManagerProtocol.swift
//  MarvelPlayground
//
//  Created by Cody Miller on 5/2/21.
//

import Foundation

protocol CharacterManagerProtocol {
    var characters: [Character] { get set }
    func get(completion: @escaping (Result<[Character], NetworkError>) -> Void)
}
