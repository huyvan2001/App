//
//  User.swift
//  Twitter
//
//  Created by Lê Văn Huy on 24/08/2022.
//

import Foundation
import FirebaseFirestoreSwift
import FirebaseAuth
struct User: Identifiable,Decodable{
    @DocumentID var id : String?
    let username: String
    let fullname : String
    let profileImageUrl: String
    let email: String
    var isCurrentUser: Bool{
        return Auth.auth().currentUser?.uid == id
    }
}

