//
//  MenuSelectionView.swift
//  OctaCard
//
//  Created by octavianus on 23/06/20.
//  Copyright © 2020 com.octavianus. All rights reserved.
//

import Foundation
import SwiftUI

let screen = UIScreen.main
let secondaryColor = Color(red: 78/255, green: 88/255, blue: 81/255)

struct MenuSelectionView: View{
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View{
        ZStack (alignment: .leading){
            Ellipse()
                .fill(secondaryColor)
                .rotationEffect(.init(degrees: 90))
                .offset(x: 0, y: -screen.bounds.height * 0.5)
                
            ScrollView(.vertical) {
                VStack (alignment: .leading){
                    Group{
                        Text("Welcome To the Academy")
                               .font(.system(size: 36, weight: .heavy, design: .rounded))

                        Text("Meet all of the members Here")
                            .font(.system(size: 18, weight: .regular,design: .rounded))
                            .padding(.bottom, 45)

                    }
                    .foregroundColor(Color.white)
                    .padding(.leading)
                    
                    if self.networkManager.mentors.count == 0{
                        Text("Fetching data...").padding()
                    }
                    
                    PersonsCategory(mentors: self.networkManager.mentors.filter{ $0.fields.domain == "Tech" },category: "Tech Mentor")
                        
                    
                    PersonsCategory(mentors: self.networkManager.mentors.filter{ $0.fields.domain == "Design" },category: "Design Mentor")
                    
                    
                    PersonsCategory(mentors: self.networkManager.mentors.filter{ $0.fields.domain == "Ops" },category: "Ops Crew")
                    
                    
                    PersonsCategory(mentors: self.networkManager.mentors.filter{ $0.fields.domain == "Business" },category: "Business Mentor")
                    
                    PersonsCategory(mentors: self.networkManager.mentors.filter{ $0.fields.domain == "Manager" },category: "Manager")

                }
            }
            .frame(maxWidth: .infinity)
        }.onAppear {
            self.networkManager.fetchMentorData()
        }
    }
}

struct MenuPreviewProvider: PreviewProvider{
    static var previews: some View{
        MenuSelectionView().environment(\.colorScheme, .dark)
        }
}



