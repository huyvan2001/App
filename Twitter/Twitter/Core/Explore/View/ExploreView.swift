//
//  ExploreView.swift
//  Twitter
//
//  Created by Lê Văn Huy on 22/08/2022.
//

import SwiftUI

struct ExploreView: View {
    @ObservedObject var viewModel = ExploreViewModel()
    var body: some View {
        ScrollView{
            searchBar(text: $viewModel.searchText)
                .padding()
            LazyVStack{
                ForEach(viewModel.searchableUser){ user in
                    NavigationLink {
                        ProfileView(user: user)
                    } label: {
                        UserRowView(user: user)
                    }

                }
            }
        }
        .navigationTitle("Explore")
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
