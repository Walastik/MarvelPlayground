//
//  MainView.swift
//  MarvelPlayground
//
//  Created by Cody Miller on 5/1/21.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Image(systemName: "square.grid.2x2")
                    Text("Content")
                }
            
            CharactersListView()
                .tabItem {
                    Image(systemName: "person.3.fill")
                    Text("Characters")
                }
            
            ComicsListView()
                .tabItem {
                    Image(systemName: "book.fill")
                    Text("Comics")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
