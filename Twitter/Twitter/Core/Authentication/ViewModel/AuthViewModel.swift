//
//  AuthViewModel.swift
//  Twitter
//
//  Created by Lê Văn Huy on 23/08/2022.
//

import Foundation
import Firebase
import FirebaseAuth
import SwiftUI
class AuthViewModel : ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var didAuthenticateUser:Bool = false
    @Published var currentUser: User?
    var tempUserSession: FirebaseAuth.User?
    private let service = UserService()
    init(){
        self.userSession = Auth.auth().currentUser
        self.fetchUser()
    }
    
    func login(withEmail email: String, password: String){
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error{
                print("DEBUG: Fail to sign in with error is \(error.localizedDescription)")
                return
            }
            guard let user = result?.user else { return }
            self.userSession = user
            self.fetchUser()
        }
    }
    func register(withEmail email: String, username: String, fullname: String, password: String){
        Auth.auth().createUser(withEmail: email, password: password){ result,error in
            if let error = error{
                print("DEBUG: Fail to register with error is \(error.localizedDescription)")
                return
            }
            guard let user = result?.user else { return }
            
            self.tempUserSession = user
            
            let data = ["username":username.lowercased(),
                        "email":email,
                        "fullname":fullname,
                        "uid":user.uid]
            
            Firestore.firestore()
                .collection("users")
                .document(user.uid)
                .setData(data){ _ in
                    self.didAuthenticateUser = true
                    
                }
            
        }
        
    }
    func signOut(){
//        set userSession to nil to the login view
        self.userSession = nil
//       signs user out in server
        self.didAuthenticateUser = false
        try? Auth.auth().signOut()
    }
    func uploadProfileImage(_ image: UIImage){
        guard let uid = tempUserSession?.uid else {return}
        ImageUploader.uploadImage(image: image) { profileImageUrl in
            Firestore.firestore()
                .collection("users")
                .document(uid)
                .updateData(["profileImageUrl":profileImageUrl]) { _ in
                    self.userSession = self.tempUserSession
                    self.fetchUser()
                }
        }
        
    }
    func fetchUser(){
        guard let uid = userSession?.uid else {
            return
        }
        service.fetchUser(withUid: uid) { user in
            self.currentUser = user
        }
    }
}
