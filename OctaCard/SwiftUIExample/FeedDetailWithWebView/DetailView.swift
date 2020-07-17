//
//  DetailView.swift
//  OctaCard
//
//  Created by octavianus on 22/06/20.
//  Copyright © 2020 com.octavianus. All rights reserved.
//

import SwiftUI
import WebKit

struct DetailView: View{
    let url: String
    
    var body: some View{
        WebView(urlString: url)
    }
}


struct DetailViewPreview: PreviewProvider{
    static var previews: some View{
        DetailView(url: "a")
    }
}


