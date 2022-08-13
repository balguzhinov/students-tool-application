//
//  ProfileView.swift
//  Final
//
//  Created by Абай on 20.05.2022.
//

import SwiftUI
import GoogleSignIn

struct ProfileView: View {
    @EnvironmentObject var viewModel: AuthenticationViewModel
    
    private let user = GIDSignIn.sharedInstance.currentUser
    
    var body: some View {
      NavigationView {
        VStack {
            HStack {
            NetworkImage(url: user?.profile?.imageURL(withDimension: 200))
              .aspectRatio(contentMode: .fit)
              .frame(width: 100, height: 100, alignment: .center)
              .cornerRadius(8)
            
            VStack(alignment: .leading) {
              Text(user?.profile?.name ?? "")
                .font(.headline)
              
              Text(user?.profile?.email ?? "")
                .font(.subheadline)
            }
            
            Spacer()
          }
          .padding()
          .frame(maxWidth: .infinity)
          .background(Color(.secondarySystemBackground))
          .cornerRadius(12)
          .padding()
          
          Spacer()
        }
      }
      .navigationViewStyle(StackNavigationViewStyle())
    }
  }



struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
