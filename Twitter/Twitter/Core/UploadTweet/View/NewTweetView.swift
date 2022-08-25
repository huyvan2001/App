//
//  NewTweetView.swift
//  Twitter
//
//  Created by Lê Văn Huy on 22/08/2022.
//

import SwiftUI
import Kingfisher
struct NewTweetView: View {
    @State private var caption = ""
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var authViewModel: AuthViewModel
    @ObservedObject var viewModel = UploadTweetViewModel()
    var body: some View {
        VStack{
            HStack{
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Cancel")
                        .foregroundColor(Color(.systemBlue))
                }

                Spacer()
                
                Button {
                    viewModel.uploadTweet(withCaption: caption)
                } label: {
                    Text("Tweet")
                        .padding(.horizontal)
                        .padding(.vertical,8)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                    
                }
            }
            .padding()
            
            if let user = authViewModel.currentUser{
                HStack(alignment: .top){
                    KFImage(URL(string: user.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 64, height: 64)
                    TextArea("What's happening?", text: $caption)
                }
                .padding()
            }
            Spacer()
        }
        .onReceive(viewModel.$didUploadTweet) { success in
            if success{
                presentationMode.wrappedValue.dismiss()
            }
            else{
                
            }
        }
    }
}

struct NewTweetView_Previews: PreviewProvider {
    static var previews: some View {
        NewTweetView()
    }
}
