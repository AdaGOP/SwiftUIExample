//
//  WebView.swift
//  OctaCard
//
//  Created by octavianus on 22/06/20.
//  Copyright © 2020 com.octavianus. All rights reserved.
//
import Foundation
import SwiftUI
import WebKit

struct WebView: UIViewRepresentable{
    let urlString: String
    
    func makeUIView(context: Context) -> WebView.UIViewType {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let url = URL(string: urlString){
            let request = URLRequest(url: url)
            uiView.load(request)
        }
    }
    
    
}

struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
