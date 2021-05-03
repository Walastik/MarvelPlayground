//
//  HeroesListView.swift
//  MarvelPlayground
//
//  Created by Cody Miller on 5/1/21.
//

import SwiftUI

struct CharactersListView: View {
    @ObservedObject var charactersService = CharacterViewModel()
    @State private var characters = ["Iron Man", "Spiderman"]
    @State private var searchTerm = ""
    
    init() {
        UITableView.appearance().separatorStyle = .none
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        ZStack {
            Color.black
            
            VStack(alignment: .leading) {
                List {
                    Group {
                        SearchBarView(searchTerm: $searchTerm)
                        
                        ForEach(getCharacters(), id: \.id) { character in
                            CharacterCell(character: character)
                        }
                    }.listRowBackground(Color.clear)
                    .listRowInsets(EdgeInsets())
                }.onAppear {
                    fetchData(for: characters)
                }.onChange(of: characters, perform: { value in
                    
                })
                .listStyle(PlainListStyle())
                .foregroundColor(.white)
            }.padding(.horizontal, 32)
        }
        
    }
    
    private func getCharacters() -> [Character] {
        return searchTerm.isEmpty
            ? charactersService.characters
            : charactersService.characters.filter({$0.name?.lowercased().contains(searchTerm.lowercased()) ?? false})
    }
    
    private func fetchData(for names: [String]) {
        charactersService.get(completion: {_ in})
    }
}

struct CharactersListView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersListView()
    }
}
