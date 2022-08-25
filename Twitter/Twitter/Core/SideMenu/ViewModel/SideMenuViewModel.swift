//
//  SlideMenuViewModel.swift
//  Twitter
//
//  Created by Lê Văn Huy on 22/08/2022.
//

import Foundation

enum SideMenuViewModel: Int, CaseIterable {
    case profile
    case list
    case bookmarks
    case logout
    
    var title: String {
        switch self {
        case .profile : return "Profile"
        case .list : return "List"
        case .bookmarks : return "Bookmarks"
        case .logout : return "Logout"
        }
    }
    var imageName: String {
        switch self {
        case .profile : return "person"
        case .list : return "list.bullet"
        case .bookmarks : return "bookmark"
        case .logout : return "arrow.left.square"
            
        }
    }
}
