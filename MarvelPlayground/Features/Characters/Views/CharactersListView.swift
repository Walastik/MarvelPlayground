//
//  HeroesListView.swift
//  MarvelPlayground
//
//  Created by Cody Miller on 5/1/21.
//

import SwiftUI

struct CharactersListView: View {
    @ObservedObject var charactersViewModel = CharacterViewModel()
    @State private var searchTerm = ""
    
    var body: some View {
        ZStack {
            Color.black
            
            VStack(alignment: .leading) {
                NavigationView {
                    List {
                        Group {
                            SearchBarView(searchTerm: $searchTerm)
                            
                            ForEach(getCharacters(), id: \.id) { character in
                                NavigationLink(destination: CharacterDetailView(character: character)) {
                                    CharacterListItemView(character: character)
                                }
                            }
                        }.listRowBackground(Color.clear)
                        .listRowInsets(EdgeInsets())
                    }.onAppear {
                        fetchData()
                    }
                }
            }.padding(.horizontal, 10)
        }
        
    }
    
    private func getCharacters() -> [Character] {
        return searchTerm.isEmpty
            ? charactersViewModel.characters
            : charactersViewModel.characters.filter({$0.name?.lowercased().contains(searchTerm.lowercased()) ?? false})
    }
    
    private func fetchData() {
        charactersViewModel.get(completion: {_ in})
    }
    
    private func fetchDataByName(name: String) -> [Character] {
        charactersViewModel.getByName(name: name, completion: {_ in})
        return charactersViewModel.characters
    }
}

struct CharactersListView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersListView()
    }
}
