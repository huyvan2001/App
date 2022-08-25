//
//  RegisterView.swift
//  Twitter
//
//  Created by Lê Văn Huy on 22/08/2022.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var username = ""
    @State private var fullname = ""
    @State private var password = ""
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        VStack{
            
            NavigationLink(destination: ProfilePhotoSeclectorView(), isActive: $viewModel.didAuthenticateUser, label: {
                
            })
            
            AuthHeaderView(title1: "Get started.", title2: "Create your account")
            
            VStack(spacing: 40){
               CustomInputField(image: "envelope", placeholderText: "Email", text: $email)
                
                CustomInputField(image: "person", placeholderText: "Username", text: $username)
                
                CustomInputField(image: "person", placeholderText: "Fullname", text: $fullname)
                
                CustomInputField(image: "lock", placeholderText: "Password", isSecuredField: true, text: $password)
            }
            .padding(32)
            
            Button {
                viewModel.register(withEmail: email, username: username, fullname: fullname, password: password)
            } label: {
                Text("Sign up")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 340, height: 50)
                    .background(Color(.systemBlue))
                    .clipShape(Capsule())
                    .padding()
                
            }
            .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
            
            Spacer()
            
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                HStack{
                    Text("Already have an account?")
                        .font(.footnote)
                    
                    Text("Sign in")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
                
            } .padding(.bottom,32)
              .foregroundColor(Color(.systemBlue))

        }
        .ignoresSafeArea()
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
