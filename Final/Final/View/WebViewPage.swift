//
//  WebViewPage.swift
//  Final
//
//  Created by Абай on 12.06.2022.
//

import SwiftUI

struct WebViewPage: View {
    var body: some View {
        NavigationView{
            WebViewModel(url: URL(
            string: "https://moodle.astanait.edu.kz/"))
        }
    }
}

struct WebViewPage_Previews: PreviewProvider {
    static var previews: some View {
        WebViewPage()
    }
}
