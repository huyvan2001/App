//
//  LoginView.swift
//  Twitter
//
//  Created by Lê Văn Huy on 22/08/2022.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel : AuthViewModel
    var body: some View {
        //parent container
        VStack {
            //headerview
            AuthHeaderView(title1: "Hello.", title2: "Welcome back")
            
            VStack(spacing: 40){
               CustomInputField(image: "envelope",
                                placeholderText: "Email",
                                text: $email)
                
                CustomInputField(image: "lock",
                                 placeholderText: "Password",
                                 isSecuredField: true,
                                 text: $password)
            }
            .padding(.horizontal,32)
            .padding(.top,44)
            
            HStack{
                Spacer()
                
                NavigationLink {
                    Text("Reset password view")
                } label: {
                    Text("Forgot password?")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(Color(.systemBlue))
                        .padding(.top)
                        .padding(.trailing,24)
                }
                
               

            }
            .navigationBarHidden(true)
            
            Button {
                viewModel.login(withEmail: email, password: password)
            } label: {
                Text("Sign in")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 340, height: 50)
                    .background(Color(.systemBlue))
                    .clipShape(Capsule())
                    .padding()
                
            }
            .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
            
        Spacer()

                NavigationLink {
                    RegistrationView()
                        .navigationBarHidden(true)
                } label: {
                    HStack{
                        Text("Don't have account?")
                            .font(.footnote)
                        
                        Text("Sign up")
                            .font(.footnote)
                            .fontWeight(.semibold)
                    }
                    
                } .padding(.bottom,32)
                  .foregroundColor(Color(.systemBlue))


        }
        .ignoresSafeArea()
        .navigationBarHidden(true)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
