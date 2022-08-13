//
//  FinalApp.swift
//  Final
//
//  Created by Абай on 20.05.2022.
//

import SwiftUI
import Firebase
import GoogleSignIn
import RealmSwift

@main
struct FinalApp: SwiftUI.App {
    @StateObject var viewModel = AuthenticationViewModel()
    
    init() {
        setupAuthentication()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)            
        }
    }
}

extension FinalApp {
    private func setupAuthentication() {
        FirebaseApp.configure()
    }
}
