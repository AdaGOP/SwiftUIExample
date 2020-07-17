//  ContentView.swift
//  OctaCard
//
//  Created by octavianus on 19/06/20.
//  Copyright © 2020 com.octavianus. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    var mentor: MentorData
    var body: some View {
        ZStack {
            VStack {
                Color("mentorsPrimary")
                    .frame(height: 240)
                VStack{
                    Image("\(mentor.imageName)")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 150)
                        
                        .clipShape(Circle())
                        .overlay(
                            Circle().stroke(Color.gray, lineWidth: 5)
                        )
                        
                    Text("\(mentor.name)".capitalized)
                        .font(Font.custom("Loveland Personal Use", size: 40))
                    Text("\(mentor.role)".capitalized)
                        .font(.callout)
                    
                    ZStack{
                        Color("mentorsPrimary")
                        VStack{
                            InfoView(image: "envelope.circle",text: "\(mentor.email)")
                            InfoView(image: "phone.circle",text: "\(mentor.phone)")
                            Spacer()
                        }.padding(.all)
                    }
                }.offset(y: -75)
                
            }.edgesIgnoringSafeArea(.all)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            ProfileView(mentor: MentorData.defaultData().first!).environment(\.colorScheme, .dark)
//            ContentView().environment(\.colorScheme, .dark)
        }
    }
}

struct InfoView: View {
    let image: String
    let text: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .frame(height: 50)
            .foregroundColor(.white)
            .overlay(
                HStack{
                    Image(systemName: image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 30)
                        .foregroundColor(.gray)
                    Text(text)
                    .foregroundColor(.gray)
                    Spacer()
                }.padding(.horizontal)
        )
    }
}
