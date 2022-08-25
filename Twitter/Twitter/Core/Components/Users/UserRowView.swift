//
//  UserRowView.swift
//  Twitter
//
//  Created by Lê Văn Huy on 22/08/2022.
//

import SwiftUI
import Kingfisher
struct UserRowView: View {
    let user: User
    var body: some View {
        HStack(spacing:12){
            KFImage(URL(string: user.profileImageUrl))
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .frame(width: 48, height: 48)
            VStack(alignment: .leading, spacing: 4){
                Text(user.fullname)
                    .font(.subheadline)
                    .foregroundColor(.black)
                    .bold()
                Text("@\(user.username)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding(.horizontal)
        .padding(.vertical,4)
    }
}

struct UserRowView_Previews: PreviewProvider {
    static var previews: some View {
        UserRowView(user: User(id: NSUUID().uuidString,
                               username: "abc",
                               fullname: "LeVanHuy",
                               profileImageUrl: "",
                               email: "@.com"))
    }
}
