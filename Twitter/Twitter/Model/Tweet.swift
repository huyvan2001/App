//
//  Tweet.swift
//  Twitter
//
//  Created by Lê Văn Huy on 24/08/2022.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift
struct Tweet: Identifiable,Decodable{
    @DocumentID var id : String?
    let caption: String
    let timestamp: Timestamp
    let uid: String
    var likes : Int
    var user: User?
    var didLike : Bool? = false
}

