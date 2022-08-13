//
//  ContentView.swift
//  Final
//
//  Created by Абай on 20.05.2022.
//

import SwiftUI
import RealmSwift

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthenticationViewModel

    var body: some View {
        switch viewModel.state {
          case .signedIn: HomeView()
          case .signedOut: LoginView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
