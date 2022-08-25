//
//  UploadTweetNewModel.swift
//  Twitter
//
//  Created by Lê Văn Huy on 24/08/2022.
//

import Foundation
class UploadTweetViewModel: ObservableObject{
    @Published var didUploadTweet = false
    let service = TweetService()
    func uploadTweet(withCaption caption: String){
        service.uploadTweet(caption: caption) { success in
            if success{
                self.didUploadTweet = true
            }
            else{
            }
        }
    }
}
