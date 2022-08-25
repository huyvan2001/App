//
//  AuthHeaderView.swift
//  Twitter
//
//  Created by Lê Văn Huy on 23/08/2022.
//

import SwiftUI
import FirebaseAuth
struct AuthHeaderView: View {
    let title1 : String
    let title2 : String
    var body: some View {
        VStack(alignment: .leading){
            HStack{ Spacer()}
            Text(title1)
                .font(.largeTitle)
                .fontWeight(.semibold)
            Text(title2)
                .font(.largeTitle)
                .fontWeight(.semibold)
            
        }
        .frame(height: 260)
        .padding(.leading)
        .background(Color(.systemBlue))
        .foregroundColor(.white)
        .clipShape(RoundedShape(corners: [.bottomRight]))
    }
}

struct AuthHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        AuthHeaderView(title1: "Hello.", title2: "Welcome Back")
    }
}