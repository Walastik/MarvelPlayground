//
//  CharacterViewModel.swift
//  MarvelPlayground
//
//  Created by Cody Miller on 5/2/21.
//

import Foundation

final class CharacterViewModel: CharacterManagerProtocol, ObservableObject {
    @Published var characters: [Character] = []
    
    func get(completion: @escaping (Result<[Character], NetworkError>) -> Void) {
        let url = URL(string: CharactersService.searchUrl())!
        NetworkUtils<MarvelApiBaseResponse<Character>>()
            .fetch(from: url) { (result) in
            switch result {
            case .failure(let err):
                print(err)
                
            case .success(let resp):
                self.characters = resp.data?.results ?? []
            }
        }
    }
    
    func getByName(name: String, completion: @escaping (Result<[Character], NetworkError>) -> Void) {
        let url = URL(string: CharactersService.nameSearchUrl(for: name))!
        NetworkUtils<MarvelApiBaseResponse<Character>>()
            .fetch(from: url) { (result) in
            switch result {
            case .failure(let err):
                print(err)

            case .success(let resp):
                self.characters = resp.data?.results ?? []
            }
        }
    }
}
