//
//  MenuSelectionCardView.swift
//  OctaCard
//
//  Created by octavianus on 23/06/20.
//  Copyright © 2020 com.octavianus. All rights reserved.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins

struct MenuSelectionCardView: View {
    var mentor: MentorRecord
    
    var image: Image?
    
    var body: some View {
        
        ZStack(alignment: .bottom){
            Image(mentor.fields.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                
            VStack(alignment: .leading){
                Text("\(mentor.fields.name)")
                    .font(.system(size: 30, weight: .heavy, design: .rounded))
                    .foregroundColor(.white)
                    .padding(.bottom, 3)
                    .padding(.leading)
            }
            
            .frame(
                width: screen.bounds.width * 0.75,
                height: screen.bounds.height * 0.15, alignment: .topLeading)
            .background(Color.black.opacity(0.8))
        }
        .frame(
            width: screen.bounds.width * 0.75,
            height: screen.bounds.height * 0.4)
        .cornerRadius(16)
        .shadow(radius: 4)
        

        
    }
    
    mutating func loadImage(_ imageName: String){
        guard let inputImage = UIImage(named: imageName) else { return }
        let beginImage = CIImage(image: inputImage)
        
        let context = CIContext()
        let currentFilter = CIFilter.sepiaTone()
        currentFilter.inputImage = beginImage
        currentFilter.intensity = 0.1
        
        
        guard let outputImage = currentFilter.outputImage else { return }
        
        if let cgimg = context.createCGImage(outputImage, from: outputImage.extent){
            let uiImage = UIImage(cgImage: cgimg)
            image = Image(uiImage: uiImage)
        }
        
    }
}

struct MenuSelectionCardView_Previews: PreviewProvider {
    static var previews: some View {
        MenuSelectionCardView(mentor: MentorRecord(id: "asd", fields: Mentor(name: "Yenny", imageName: "yenny", domain: "Manager"), createdTime: "asd"))
    }
}


struct Person: Identifiable{
    var id: String
    var name: String
    var description: String
    var image: String
    
    
    static func defaultData() -> [Person]{
        return [
            Person(id: "1", name: "Octa",description: "This is the crazy guy", image: "octa"),
            Person(id: "2", name: "fanni",description: "This is the rewel girl", image: "fanni"),
            Person(id: "3", name: "david",description: "This is the crazy guy", image: "david"),
            Person(id: "4", name: "Phil",description: "This is the crazy guy", image: "phil")
        ]
    }
}
