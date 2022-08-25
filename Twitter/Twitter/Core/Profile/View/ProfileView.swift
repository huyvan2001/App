//
//  ProfileView.swift
//  Twitter
//
//  Created by Lê Văn Huy on 22/08/2022.
//

import SwiftUI
import Kingfisher
struct ProfileView: View {
    @State private var selectedFiller: TweetFillerViewModel = .tweets
    @ObservedObject var viewModel : ProfileViewModel
    @Namespace var animation
    @Environment(\.presentationMode) var mode
    init(user: User){
        self.viewModel = ProfileViewModel(user: user)
    }
    var body: some View {
        VStack(alignment: .leading){
            headerView
            
            actionButton
            
            userInfoDetail
            
            tweetFilterBar
            
            tweetView
            
            Spacer()
        }
        .navigationBarHidden(true)
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: User(id: NSUUID().uuidString,
                               username: "03.nmt",
                               fullname: "NMT",
                               profileImageUrl: "",
                               email: "nmt@gmail.com"))
    }
}

extension ProfileView {
    var headerView: some View{
            ZStack(alignment: .bottomLeading){
                Color(.systemBlue)
                    .ignoresSafeArea()
                VStack {
                    Button {
                        mode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "arrow.left")
                            .resizable()
                            .frame(width: 20, height: 16)
                            .foregroundColor(.white)
                            .offset(x: 16, y: -4)
                    }

                    KFImage(URL(string: viewModel.user.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 74, height: 74)
                    .offset(x: 16, y: 24)
                }
            }
            .frame(height:96)
    }
    var actionButton : some View {
        HStack(spacing:12){
            Spacer()
            Image(systemName: "bell.badge")
                .font(.title3)
                .padding(6)
                .overlay(
                    Circle()
                        .stroke(Color.gray,lineWidth: 0.75)
                )
            Button {
                //
            } label: {
                Text(viewModel.actionButtonTitle)
                    .font(.subheadline).bold()
                    .foregroundColor(.black)
                    .frame(width: 120, height: 32)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.gray,lineWidth:0.75)
                    )
            }

        }
        .padding(.trailing)
    }
    
    var userInfoDetail: some View {
        VStack(alignment: .leading, spacing: 4){
            HStack {
                Text(viewModel.user.fullname)
                    .font(.title2).bold()
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(Color(.systemBlue))
            }
            
            Text("@\(viewModel.user.username)")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Text("Hello welcome to nmt")
                .font(.subheadline)
                .padding(.vertical)
            
            HStack(spacing:24) {
                HStack{
                    Image(systemName: "mappin.and.ellipse")
                    
                    Text("Da Nang,Viet Nam")
                }
                HStack {
                    Image(systemName: "link")
                    
                    Text("www.lvh.com")
                }
            }
            .font(.caption)
            .foregroundColor(.gray)
            
            
            UserStatsView()
            .padding(.vertical)

        }
        .padding(.horizontal)
    }
    var tweetFilterBar: some View {
        HStack{
            ForEach(TweetFillerViewModel.allCases,id: \.rawValue){ item in
                VStack{
                    Text(item.title)
                        .font(.subheadline)
                        .fontWeight(selectedFiller == item ? .semibold : .regular)
                        .foregroundColor(selectedFiller == item ? .black : .gray)
                    if selectedFiller == item {
                        Capsule()
                            .foregroundColor(Color(.systemBlue))
                            .frame(height:3)
                            .matchedGeometryEffect(id: "filler", in: animation)
                    }
                    else{
                        Capsule()
                            .foregroundColor(Color(.clear))
                            .frame(height:3)
                    }
                }
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        self.selectedFiller = item
                    }
                }
                
                
            }
        }
        .overlay(Divider().offset(x:0,y:16))
    }
    var tweetView: some View{
        ScrollView{
            LazyVStack{
                ForEach(viewModel.tweets(forFiller: self.selectedFiller)){
                    tweet in
                    TweetRowView(tweet: tweet)
                        .padding()
                }
            }
        }
    }
}
