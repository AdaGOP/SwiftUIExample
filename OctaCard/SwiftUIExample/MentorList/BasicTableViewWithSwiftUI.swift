//
//  BasicTableViewWithSwiftUI.swift
//  OctaCard
//
//  Created by octavianus on 13/07/20.
//  Copyright © 2020 com.octavianus. All rights reserved.
//

import SwiftUI

struct BasicTableViewWithSwiftUI: View {
    
    let mentors = MentorData.defaultData()
    
    var body: some View {
        NavigationView {
            List(mentors, id: \.name) { mentor in
                NavigationLink(destination: ProfileView(mentor: mentor)) {
                    HStack{
                        Image("\(mentor.imageName)")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 100)
                                .clipShape(Circle())

                            VStack(alignment: .leading){
                                Text("\(mentor.name)".capitalized)
                                    .font(.system(size: 24, weight: .bold, design: .rounded))
                                Text("\(mentor.role)")
                            }
                            Spacer()
                            Image(systemName: self.getIconRoleName(role: mentor.role))
                        }
                    }
                }
            .navigationBarTitle("Mentors")
        }

    }
    
    
    
    func getIconRoleName(role: String) -> String{
        if role == "Tech Mentor"{
            return "wrench"
        }else
        if role == "Design Mentor"{
            return "paintbrush"
        }else
        if role == "Business Mentor"{
            return "briefcase"
        }
        return ""
    }
}































struct MentorData: Identifiable{
    var id: String { name }
    let name: String
    let imageName: String
    let email: String
    let phone: String
    let role: String
    
    static func defaultData() -> [MentorData]{
        var mentors = [MentorData]()
        mentors.append(MentorData(name: "david", imageName: "david", email: "david@binus.edu", phone: "123123", role: "Tech Mentor"))
        mentors.append(MentorData(name: "vero", imageName: "vero", email: "vero@binus.edu", phone: "11111", role: "Design Mentor"))
        mentors.append(MentorData(name: "Henri", imageName: "henri", email: "david@binus.edu", phone: "123123", role: "Business Mentor"))
        
        return mentors
        
    }
}

struct BasicTableViewWithSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            BasicTableViewWithSwiftUI().environment(\.colorScheme, .dark)
//            BasicTableViewWithSwiftUI().environment(\.colorScheme, .light)
        }
    }
}



























/* "Welcome to part 4" */
























