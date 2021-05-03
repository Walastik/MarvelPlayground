//
//  CharacterDetailView.swift
//  MarvelPlayground
//
//  Created by Cody Miller on 5/3/21.
//

import SwiftUI

struct CharacterDetailView: View {
    let character: Character
    var characterImageUrl: String {
        return "\(character.thumbnail?.path ?? "")/portrait_medium.\(character.thumbnail?.fileExtension ?? "")"
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20) {
                HStack {
                    AsyncImage(url: URL(string: characterImageUrl)!,
                               placeholder: { Text("Loading ...") },
                               image: { Image(uiImage: $0).resizable() })
                        .scaledToFit()
                        .frame(width: 100, height: 150)
                    
                    Text(character.description ?? "Error")
                        .font(.body)
                        .multilineTextAlignment(.leading)
                        .padding(.trailing, 8)
                }
                
                Text("Comic History")
                    .bold()
                
                Text("Comics Available: \(character.comics?.available ?? 0)")
                
                ForEach(getComicItems(), id: \.name) { comicItem in
                    Text("\(comicItem.name ?? "Name Missing")")
//                    Link("\(comicItem.name ?? "Name Missing")", destination: URL())
                }
            }
        }
        .navigationBarTitle(character.name ?? "Error", displayMode: .inline)
    }
    
    private func getComicItems() -> [RelatedItemData] {
        return character.comics?.items ?? [RelatedItemData]()
    }
}
