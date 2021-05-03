//
//  SearchCharactersListView.swift
//  MarvelPlayground
//
//  Created by Cody Miller on 5/2/21.
//

import SwiftUI

struct SearchBarView: View {
    
    @Binding var searchTerm: String
    
    var body: some View {
        CustomTextField(placeholder: Text("Search").foregroundColor(Color.gray), text: $searchTerm)
            .foregroundColor(.gray)
            .padding(.leading, 40)
            .frame(height: 30)
            .background(ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color.gray.opacity(0.6))
                Image(systemName: "magnifyingglass")
                    .foregroundColor(Color.gray)
                    .padding(.leading, 10)
            })
        
    }
}

struct SearchCharactersListView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(searchTerm: .constant(""))
    }
}
