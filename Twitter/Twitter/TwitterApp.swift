//
//  TwitterApp.swift
//  Twitter
//
//  Created by Lê Văn Huy on 22/08/2022.
//

import SwiftUI
import Firebase
import FirebaseAuth
@main
struct TwitterApp: App {
    @StateObject var viewModel = AuthViewModel()
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ContentView()

            }
            .environmentObject(viewModel)
        }
    }
}
