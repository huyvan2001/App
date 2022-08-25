//
//  searchBar.swift
//  Twitter
//
//  Created by Lê Văn Huy on 24/08/2022.
//

import SwiftUI

struct searchBar: View {
    @Binding var text : String
    var body: some View {
        HStack{
            TextField("Search...",text : $text)
                .padding(8)
                .padding(.horizontal,34)
                .background(Color(.systemGray6))
                .cornerRadius(9)
                .overlay(
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0,maxWidth: .infinity,alignment: .leading)
                            .padding(.leading,8)
                    }
                )
            
        }
        .padding(.horizontal,4)
    }
}

struct searchBar_Previews: PreviewProvider {
    static var previews: some View {
        searchBar(text: .constant(""))
            .previewLayout(.sizeThatFits)
    }
}
