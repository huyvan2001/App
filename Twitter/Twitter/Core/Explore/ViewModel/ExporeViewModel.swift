//
//  ExporeViewModel.swift
//  Twitter
//
//  Created by Lê Văn Huy on 24/08/2022.
//

import Foundation
class ExploreViewModel: ObservableObject {
    @Published var users = [User]()
    @Published var searchText = ""
    let service = UserService()
    var searchableUser: [User] {
        if searchText.isEmpty{
            return users
        }
        else{
            let lowercaseQuery = searchText.lowercased()
            return users.filter({
                $0.username.contains(lowercaseQuery) ||
                $0.fullname.contains(lowercaseQuery)
            })
        }
    }
    init(){
        self.fetchUsers()
    }
    func fetchUsers(){
        service.fetchUsers { users in
            self.users = users
        }
    }
}
