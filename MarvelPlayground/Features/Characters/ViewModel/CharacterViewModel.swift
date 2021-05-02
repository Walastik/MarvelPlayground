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
//        var internalCharacters = [Character]()
        let url = URL(string: CharactersService.searchUrl())!
        NetworkUtils<CharactersResponse>()
            .fetch(from: url) { (result) in
            switch result {
            case .failure(let err):
                print(err)
                
            case .success(let resp):
                self.characters = resp.data.results
            }
        }
        
        
        
//        let getQueue = DispatchQueue(label: "charactersDispatchQ")
//        let charGroup = DispatchGroup()
//
//        chars.forEach { (char) in
//            charGroup.enter()
//            let url = URL(string: CharactersService.searchUrl())!
//            NetworkUtils<CharactersResponse>()
//                .fetch(from: url) { (result) in
//                switch result {
//                case .failure(let err):
//                    print(err)
//                    getQueue.async {
//                        charGroup.leave()
//                    }
//
//                case .success(let resp):
//                    getQueue.async {
//                        internalCharacters = resp.data.results
//                        charGroup.leave()
//                    }
//                }
//            }
//        }
        
        
    }
    
//    func getByName(name: String, completion: @escaping (Result<[Character], NetworkError>) -> Void) {
//        var internalCharacters = [Character]()
//        let url = URL(string: CharactersService.nameSearchUrl(for: name))!
//        NetworkUtils<CharactersResponse>()
//            .fetch(from: url) { (result) in
//            switch result {
//            case .failure(let err):
//                print(err)
//                getQueue.async {
//                    charGroup.leave()
//                }
//
//            case .success(let resp):
//                getQueue.async {
//                    internalCharacters = resp.data.results
//                    charGroup.leave()
//                }
//            }
//        }
//    }
}
