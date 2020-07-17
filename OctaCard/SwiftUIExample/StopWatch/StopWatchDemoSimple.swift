//
//  StopWatchTestDemo.swift
//  OctaCard
//
//  Created by octavianus on 17/07/20.
//  Copyright © 2020 com.octavianus. All rights reserved.
//

import SwiftUI

struct StopWatchDemoSimple: View {
    
    let numberOfSeconds: Int = 60
    @State var currentSecond: Double = 0
    
    var body: some View {
        VStack {
            ZStack{
                Color.clear
                
                Pointer2()
                    .stroke(Color.orange, lineWidth: 2)
                    .rotationEffect(.degrees(currentSecond))
                
                ForEach(0..<numberOfSeconds) { second in
                    self.makeRectShape(second: second)
                }
            }
            
            .frame(
                width: UIScreen.main.bounds.width,
                height: UIScreen.main.bounds.width)
            
            Button(action: {
                Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { (_) in
                    self.currentSecond += 0.01
                }
            }) {
                Text("Start")
            }
        }
    }
    
    func makeRectShape(second: Int) -> some View{
        VStack{
            Rectangle()
                .frame(width: 2, height: 15)
                .opacity( second % 5 == 0 ? 1 : 0.3 )
            Spacer()
        }
        .rotationEffect(
            .degrees(Double(second) / 60 * 360)
        )
    }
    
}


struct Pointer2: Shape{
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.midX, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        }
    }
    
}


struct StopWatchTestDemo_Previews: PreviewProvider {
    static var previews: some View {
        StopWatchDemoSimple()
    }
}
