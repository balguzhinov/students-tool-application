//
//  LoginView.swift
//  Final
//
//  Created by Абай on 20.05.2022.
//

import SwiftUI

struct LoginView: View {

  // 1
  @EnvironmentObject var viewModel: AuthenticationViewModel

  var body: some View {
    VStack {
      Spacer()

      // 2
      Image("header_image")
        .resizable()
        .aspectRatio(contentMode: .fit)

      Text("Добро Пожаловать!")
        .fontWeight(.black)
        .foregroundColor(Color(.systemIndigo))
        .font(.largeTitle)
        .multilineTextAlignment(.center)

      Text("Расширьте возможности своего обучения")
        .fontWeight(.light)
        .multilineTextAlignment(.center)
        .padding()

      Spacer()

      // 3
      GoogleSignInButton()
        .padding()
        .onTapGesture {
          viewModel.signIn()
        }
    }
  }
}

struct LoginView_Previews: PreviewProvider {
  static var previews: some View {
    LoginView()
  }
}
