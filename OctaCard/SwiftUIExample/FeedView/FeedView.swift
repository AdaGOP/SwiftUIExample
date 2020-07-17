//
//  FeedView.swift
//  OctaCard
//
//  Created by octavianus on 19/06/20.
//  Copyright © 2020 com.octavianus. All rights reserved.
//

import SwiftUI


struct FeedView: View{
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            List(networkManager.posts) { post in
                PostList(post: post)
            }
            .navigationBarTitle("Feed")
        }
        .onAppear {
            self.networkManager.fetchData()
        }
    }
}


struct Preview: PreviewProvider{
    static var previews: some View{
        FeedView()
    }
}

struct PostList: View {
    var post: Post
    var body: some View {
        NavigationLink(destination: DetailView(url: post.url ?? "")) {
            HStack {
                Text("\(post.points)")
                Text(post.title)
            }
        }
    }
}
