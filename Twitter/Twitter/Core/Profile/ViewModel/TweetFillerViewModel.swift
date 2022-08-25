//
//  TweetFillerViewModel.swift
//  Twitter
//
//  Created by Lê Văn Huy on 22/08/2022.
//

import Foundation

enum TweetFillerViewModel: Int,CaseIterable {
    case tweets
    case replies
    case likes
    
    var title: String {
        switch self {
        case .tweets : return "Tweets"
        case .replies : return "Replies"
        case .likes : return "Likes"
        }
    }
}
