//
//  TweetRowViewModel.swift
//  Twitter
//
//  Created by Lê Văn Huy on 24/08/2022.
//

import Foundation

class TweetRowViewModel: ObservableObject{
    @Published var tweet: Tweet
    let service = TweetService()
    init(tweet:Tweet){
        self.tweet = tweet
        self.checkIfUserLikeTweet()
    }
    func likeTweet(){
        service.likeTweets(tweet) {
            self.tweet.didLike = true
        }
    }
    func unlikeTweet(){
        service.likeTweets(tweet) {
            self.tweet.didLike = false
        }
    }
    func checkIfUserLikeTweet(){
        service.checkIfUserLikedTweet(tweet) { didLike in
            if didLike{
                self.tweet.didLike = true
            }
        }
    }
}
