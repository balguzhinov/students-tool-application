//
//  HomeView.swift
//  Final
//
//  Created by Абай on 20.05.2022.
//

import SwiftUI
import GoogleSignIn

struct HomeView: View {
    
    @State var index = 0
    @State var show = false
    @EnvironmentObject var viewModel: AuthenticationViewModel
    private let user = GIDSignIn.sharedInstance.currentUser
  
  var body: some View {
    ZStack{
        HStack{
        VStack(alignment: .leading, spacing: 12) {
            NetworkImage(url: user?.profile?.imageURL(withDimension: 200))
              .aspectRatio(contentMode: .fit)
              .frame(width: 100, height: 100, alignment: .center)
              .cornerRadius(8)
            Text("Привет,")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding(.top, 10)
            Text(user?.profile?.name ?? "")
                .fontWeight(.bold)
                .font(.title)
                .foregroundColor(.black)
            
            Button(action: {
                self.index = 0
                
                withAnimation{
                    self.show.toggle()
                }
            }) {
                HStack(spacing: 25){
                    Image("profile")
                    .foregroundColor(Color.black)
                    
                    Text("Профиль")
                    .foregroundColor(Color.black)
                }
                .padding(.vertical, 10)
                .padding(.horizontal)
                .cornerRadius(10)
            }
            .padding(.top,25)
            
            Button(action: {
                
                self.index = 1
                
                withAnimation{
                    
                    self.show.toggle()
                }
                
            }) {
                
                HStack(spacing: 25){
                    
                    Image("moodle")
                    .foregroundColor(Color.black)
                    
                    Text("Moodle")
                    .foregroundColor(Color.black)
                }
                .padding(.vertical, 10)
                .padding(.horizontal)
                .cornerRadius(10)
            }
            
            Button(action: {
                
                self.index = 2
                
                withAnimation{
                    
                    self.show.toggle()
                }
                
            }) {
                
                HStack(spacing: 25){
                    
                    Image("calendar")
                    .foregroundColor(Color.black)
                    
                    Text("Задания")
                    .foregroundColor(Color.black)
                }
                .padding(.vertical, 10)
                .padding(.horizontal)
                .cornerRadius(10)
            }
            
            Button(action: {
                
                self.index = 3
                
                withAnimation{
                    
                    self.show.toggle()
                }
                
            }) {
                
                HStack(spacing: 25){
                    
                    Image("news")
                    .foregroundColor(Color.black)
                    
                    Text("Новости")
                    .foregroundColor(Color.black)
                }
                .padding(.vertical, 10)
                .padding(.horizontal)
                .cornerRadius(10)
            }
            
            Divider()
                .frame(width: 150, height: 1)
                .background(Color.white)
                .padding(.vertical,30)
            
            Button(action: {
                viewModel.signOut()
            }) {
                
                HStack(spacing: 25){
                    
                    Image("logout")
                        .foregroundColor(Color.black)
                    
                    
                    Text("Выход")
                        .foregroundColor(Color.black)
                }
                .padding(.vertical, 10)
                .padding(.horizontal)
            }
            
            Spacer(minLength: 0)
        }
        .padding(.top,25)
        .padding(.horizontal,20)
        
        Spacer(minLength: 0)
    }
    .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)
    .padding(.bottom,UIApplication.shared.windows.first?.safeAreaInsets.bottom)
    
    
    VStack(spacing: 0){
        
        HStack(spacing: 15){
            
            Button(action: {
                
                withAnimation{
                    
                    self.show.toggle()
                }
                
            }) {
 
                Image(systemName: self.show ? "xmark" : "line.horizontal.3")
                    .resizable()
                    .frame(width: self.show ? 18 : 22, height: 18)
                    .foregroundColor(Color.black.opacity(0.4))
            }

            
            Text(self.index == 0 ? "Профиль" : (self.index == 1 ? "Moodle" : (self.index == 2 ? "Задания" : "Новости")))
                .font(.title)
                .foregroundColor(Color.black.opacity(0.6))
            
            Spacer(minLength: 0)
        }
        .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)
        .padding()
        
        GeometryReader{_ in
            
            VStack{

                if self.index == 0{
                    
                    ProfileView()
                }
                
                else if self.index == 1{
                    WebViewPage()
                }
                
                else if self.index == 2{
                   TaskView()
                }
                else{
                   SettingsView()
                }
            }
        }
        
    }
    
        .background(Color.white)
        .cornerRadius(self.show ? 30 : 0)
        .scaleEffect(self.show ? 0.9 : 1)
        .offset(x: self.show ? UIScreen.main.bounds.width / 2 : 0, y: self.show ? 15 : 0)
        .rotationEffect(.init(degrees: self.show ? -5 : 0))
    
}
    
.background(Color("Color").edgesIgnoringSafeArea(.all))
.edgesIgnoringSafeArea(.all)
    
}
}

/// A generic view which is helpful for showing images from the network.
struct NetworkImage: View {
  let url: URL?
  
  var body: some View {
    if let url = url,
       let data = try? Data(contentsOf: url),
       let uiImage = UIImage(data: data) {
      Image(uiImage: uiImage)
        .resizable()
        .aspectRatio(contentMode: .fit)
    } else {
      Image(systemName: "person.circle.fill")
        .resizable()
        .aspectRatio(contentMode: .fit)
    }
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
  }
}
