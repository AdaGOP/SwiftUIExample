//
//  MentolDetailView.swift
//  OctaCard
//
//  Created by octavianus on 14/07/20.
//  Copyright © 2020 com.octavianus. All rights reserved.
//

import SwiftUI

struct MentolDetailView: View {
    
    var mentor: GOPMentor
    
    var body: some View {
        VStack{
            Image("\(mentor.imageName)")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: UIScreen.main.bounds.height / 4)
                .clipShape(Circle())
            Text("\(mentor.name)".capitalized)
                .font(.system(size: 36, weight: .bold, design: .rounded))
        }
        
    }
}

struct MentolDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MentolDetailView(mentor: GOPMentor(id: 1, name: "octa", role: "Tech Mentor", imageName: "octa"))
    }
}
