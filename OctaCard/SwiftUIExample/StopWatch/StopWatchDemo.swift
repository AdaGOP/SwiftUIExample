//
//  StopWatchDemo.swift
//  OctaCard
//
//  Created by octavianus on 16/07/20.
//  Copyright © 2020 com.octavianus. All rights reserved.
//

import SwiftUI

struct StopWatchDemo: View {
    
    @State var secondTime: Double = 0
    @State private var timer: Timer?
    
    var body: some View {
        VStack{
            Clock(secondTime: $secondTime)
                .frame(width: screen.bounds.width, height: screen.bounds.width)
            HStack{
                Button(action: {
                    self.timer?.invalidate()
                    self.timer = nil
                    self.secondTime = 0
                }) {
                    Text("Stop")
                }
                    .foregroundColor(.red)
                    
                Button(action: {
                    self.timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { (timer) in
                        self.secondTime += 1
                    }
                }) {
                    Text("Start")
                }
                    .foregroundColor(.green)
            }
            .equalSizes()
            .padding()
            .buttonStyle(CircleStyle())
        }
        
    }
}




struct Clock: View{
    @Binding var secondTime: Double
    func tick(at tick: Int) -> some View{
        VStack{
            Rectangle()
                .fill(Color.black)
                .opacity(tick % 20 == 0 ? 1 : 0.5)
                .frame(width: 2, height: tick % 4 == 0 ? 15 : 7)
            Spacer()
        }
        .rotationEffect(
                .degrees(Double(tick) / 240 * 360)
        )
    }
    
    var body: some View{
        ZStack{
            ForEach(0..<240){ tick in
                self.tick(at: tick)
            }
            Pointer()
                .stroke(Color.orange, lineWidth: 2)
                .rotationEffect(.init(degrees: Double(secondTime)))
        }
    }
}

struct Pointer: Shape{
    var circleRadius: CGFloat = 3
    func path(in rect: CGRect) -> Path {
        Path{ p in
            p.move(to: CGPoint(x: rect.midX, y: rect.midY - circleRadius))
            p.addLine(to: CGPoint(x: rect.midX, y: rect.minY) )
            p.addEllipse(in: CGRect(
                x: rect.midX - circleRadius,
                y: rect.midY - circleRadius,
                width: circleRadius * 2,
                height:  circleRadius * 2))
        }
    }
}


struct StopWatchDemo_Previews: PreviewProvider {
    static var previews: some View {
        StopWatchDemo()
    }
}

