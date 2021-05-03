//
//  CharacterDetailView.swift
//  MarvelPlayground
//
//  Created by Cody Miller on 5/3/21.
//

import SwiftUI

struct CharacterDetailView: View {
    let character: Character
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20) {
                Text("Comics Available: \(character.comics?.available ?? 0)")
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            }
        }
        .navigationBarTitle(character.name ?? "Error", displayMode: .inline)
    }
}
