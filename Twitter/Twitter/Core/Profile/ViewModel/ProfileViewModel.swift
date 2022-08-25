//
//  ProfileViewModel.swift
//  Twitter
//
//  Created by Lê Văn Huy on 24/08/2022.
//

import Foundation
import AVKit
import SwiftUI
class ProfileViewModel: ObservableObject{
    @Published var tweets = [Tweet]()
    @Published var likeTweets = [Tweet]()
    private let userService = UserService()
    private let service = TweetService()
    let user: User
    var actionButtonTitle: String{
        return self.user.isCurrentUser ? "Edit Profile" : "Follow"
    }
    init(user: User){
        self.user = user
        self.fetchUserTweets()
        self.fetchLikeTweets()
    }
    func fetchUserTweets(){
        guard let uid = user.id else { return }
        service.fetchTweets(forUid: uid) { tweets in
            self.tweets = tweets
            for i in 0 ..< tweets.count{
                self.tweets[i].user = self.user
            }
        }
    }
    func fetchLikeTweets(){
        guard let uid = user.id else { return}
        service.fetchLikeTweets(forUid: uid) { tweets in
            self.likeTweets = tweets
            
            for i in 0..<tweets.count {
                let uid = tweets[i].uid
                self.userService.fetchUser(withUid: uid) { user in
                    self.likeTweets[i].user = user
                }
            }
        }
    }
    func tweets(forFiller filler: TweetFillerViewModel ) -> [Tweet] {
        switch filler {
        case .tweets:
            return tweets
        case .replies:
            return tweets
        case .likes:
            return likeTweets
        }
    }
}
