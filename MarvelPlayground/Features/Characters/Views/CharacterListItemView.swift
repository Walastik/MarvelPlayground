//
//  CharacterListItemView.swift
//  MarvelPlayground
//
//  Created by Cody Miller on 5/2/21.
//

import SwiftUI

struct CharacterListItemView: View {
    var character: Character
    var characterImageUrl: String {
        return "\(character.thumbnail?.path ?? "")/portrait_small.\(character.thumbnail?.fileExtension ?? "")"
    }
    
    var body: some View {
        HStack{
            AsyncImage(url: URL(string: characterImageUrl)!,
                       placeholder: { Text("Loading ...") },
                       image: { Image(uiImage: $0).resizable() }
            )
            .scaledToFit()
            .frame(width: 90, height: 90)
            
            VStack(alignment: .leading, spacing: 8, content: {
                Text(character.name ?? "Error")
                    .font(.body)
                    .bold()
                
                Text(character.description ?? "Error")
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(3)
                    .padding(.trailing, 8)
            })
        }
    }
}

struct CharacterListItemView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterListItemView(character: Character(id: 1009368, name: "Iron Man", description: "Wounded, captured and forced to build a weapon by his enemies, billionaire industrialist Tony Stark instead created an advanced suit of armor to save his life and escape captivity. Now with a new outlook on life, Tony uses his money and intelligence to make the world a safer, better place as Iron Man.", modified: "Date", thumbnail: MarvelThumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/9/c0/527bb7b37ff55", fileExtension: "jpg"), resourceURI: "http://gateway.marvel.com/v1/public/characters/1009368", comics: MarvelRelatedData(available: 2577, collectionURI: "http://gateway.marvel.com/v1/public/characters/1009368/comics", items: [RelatedItemData(resourceURI: "http://gateway.marvel.com/v1/public/comics/43495", name: "A+X (2012) #2", type: "Comic")], returned: 20), series: MarvelRelatedData(available: 2577, collectionURI: "http://gateway.marvel.com/v1/public/characters/1009368/comics", items: [RelatedItemData(resourceURI: "http://gateway.marvel.com/v1/public/comics/43495", name: "A+X (2012) #2", type: "Comic")], returned: 20), stories: MarvelRelatedData(available: 2577, collectionURI: "http://gateway.marvel.com/v1/public/characters/1009368/comics", items: [RelatedItemData(resourceURI: "http://gateway.marvel.com/v1/public/comics/43495", name: "A+X (2012) #2", type: "Comic")], returned: 20), events: MarvelRelatedData(available: 2577, collectionURI: "http://gateway.marvel.com/v1/public/characters/1009368/comics", items: [RelatedItemData(resourceURI: "http://gateway.marvel.com/v1/public/comics/43495", name: "A+X (2012) #2", type: "Comic")], returned: 20), urls: [MarvelUrlData(type: "detail", url: "http://marvel.com/characters/29/iron_man?utm_campaign=apiRef&utm_source=b51ef10775ee4834d14184fb0436c57b")]))
    }
}
