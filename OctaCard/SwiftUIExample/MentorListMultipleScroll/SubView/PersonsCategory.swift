//
//  PersonsCategory.swift
//  OctaCard
//
//  Created by octavianus on 06/07/20.
//  Copyright © 2020 com.octavianus. All rights reserved.
//

import SwiftUI

struct PersonsCategory: View {
    
    var mentors: [MentorRecord]
    let category: String
    
    var body: some View {
        VStack(alignment: .leading){
            Text(self.category)
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(secondaryColor)
                .padding(.leading)
            ScrollView(.horizontal ,showsIndicators: false) {
                HStack(spacing: 0){
                    ForEach(self.mentors){ mentor in
                        GeometryReader { proxy in
                            MenuSelectionCardView(mentor: mentor)
                                .rotation3DEffect(
                                    .degrees(
                                        Double(proxy.frame(in: .global).minX ) / -20),
                                    axis: (x: 0, y: 1, z: 0))
                                
                        }
                        .frame(
                            width: screen.bounds.width * 0.75,
                            height: screen.bounds.height * 0.4
                        )
                            .padding(.leading)
                    }
                }
            }
        }
    }
}

struct PersonsCategory_Previews: PreviewProvider {
    static var previews: some View {
        PersonsCategory(mentors: [
            MentorRecord(id: "1", fields: Mentor(name: "William", imageName: "will", domain: "Manager"), createdTime: "1"),
            MentorRecord(id: "2", fields: Mentor(name: "Yenny", imageName: "yenny", domain: "Manager"), createdTime: "2")
        
        ], category: "Manager")
    }
}
