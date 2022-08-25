//
//  ProfilePhotoSeclectorView.swift
//  Twitter
//
//  Created by Lê Văn Huy on 23/08/2022.
//

import SwiftUI

struct ProfilePhotoSeclectorView: View {
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    @EnvironmentObject var modelView: AuthViewModel
    var body: some View {
        VStack{
            AuthHeaderView(title1: "Setup Account",
                           title2: "Select a profile photo")
            Button {
                showImagePicker.toggle()
            } label: {
                if let profileImage = profileImage {
                    profileImage
                        .resizable()
                        .clipShape(Circle())
                        .modifier(ProfileImageModifier())
                }
                else{
                    Image("plus_photo")
                        .resizable()
                        .renderingMode(.template)
                        .modifier(ProfileImageModifier())
                }
            }
            .sheet(isPresented: $showImagePicker,
                   onDismiss: loadImage)
            {
                ImagePicker(selectedImage: $selectedImage)
            }
            .padding(.top,44)

            if let selectedImage = selectedImage
            {
                Button {
                    modelView.uploadProfileImage(selectedImage)
                } label: {
                    Text("Continue")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 340, height: 50)
                        .background(Color(.systemBlue))
                        .clipShape(Capsule())
                        .padding()
                    
                }
                .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
            }
            
            Spacer()
        }
        .ignoresSafeArea()
    }
    func loadImage(){
        guard let selectedImage = selectedImage else {
            return
        }
        profileImage = Image(uiImage: selectedImage)

    }
}
private struct ProfileImageModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color(.systemBlue))
            .scaledToFill()
            .frame(width: 180, height: 180)

    }

}

struct ProfilePhotoSeclectorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSeclectorView()
    }
}
