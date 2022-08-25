//
//  TweetRowView.swift
//  Twitter
//
//  Created by Lê Văn Huy on 22/08/2022.
//

import SwiftUI
import Kingfisher
struct TweetRowView: View {
    @ObservedObject var viewModel: TweetRowViewModel
    init(tweet: Tweet){
        self.viewModel = TweetRowViewModel(tweet: tweet)
    }
    var body: some View {
        VStack(alignment: .leading){
            
            if let user = viewModel.tweet.user{
                HStack(alignment:.top, spacing: 12){
                    //profile image + userinfo + tweet
                    KFImage(URL(string: user.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 56, height: 56)
                    
                    //userinfo & tweet caption
                    VStack(alignment: .leading, spacing: 4){
                    HStack{
                        //userinfo
                        Text(user.fullname)
                        .font(.subheadline).bold()
                        Text("@\(user.username)")
                        .foregroundColor(.gray)
                        .font(.caption)
                    
                    Text("2w")
                        .foregroundColor(.gray)
                        .font(.caption)
                    }
                        
                        Text(viewModel.tweet.caption)
                            .font(.subheadline)
                            .multilineTextAlignment(.leading)
                        
                    }
            }
            //action button
            HStack{
                Button {
                    //code here
                } label: {
                    Image(systemName: "bubble.left")
                        .font(.subheadline)
                }
                
                Spacer()

                Button {
                    //code here
                } label: {
                    Image(systemName: "arrow.2.squarepath")
                        .font(.subheadline)
                }
                
                Spacer()
                
                Button {
                    viewModel.tweet.didLike ?? true ? viewModel.likeTweet() : viewModel.unlikeTweet()
                } label: {
                    Image(systemName: viewModel.tweet.didLike ?? false ? "heart.fill" : "heart")
                        .font(.subheadline)
                        .foregroundColor(viewModel.tweet.didLike ?? false ? .red : .gray)
                }
                
                Spacer()
                
                Button {
                    //code here
                } label: {
                    Image(systemName: "bookmark")
                        .font(.subheadline)
                }
            }
            .padding()
            .foregroundColor(.gray)
            Divider()
        }
    }
}
}
//struct TweetRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        TweetRowView()
//    }

