//
//  AutoResizingButton.swift
//  OctaCard
//
//  Created by octavianus on 17/07/20.
//  Copyright © 2020 com.octavianus. All rights reserved.
//

import Foundation
import SwiftUI

/*
How this code works:

1. Call the Equal size on each button modifier
2. The method will create invisible color based on the size of the text, it will then give the value to the preference key
3. The preference key will be updated, and will update the width state variable on the parent
4. Once the state variable get updated, it will update the environment variable
5. The environment variable will update all the view that using that to define it size

*/


struct CircleStyle: ButtonStyle{
    
    func makeBody(configuration: Configuration) -> some View {
        let background = Circle()
        .overlay(
            Circle()
                .fill(Color.white)
                .opacity(configuration.isPressed ? 0.3 : 0)
            
        )
         .overlay(
             Circle()
                 .stroke(lineWidth: 2)
                 .foregroundColor(.white)
                 .padding(3)
         )
        
        let foreground = configuration.label
            .fixedSize()
            .padding(20)
            .equalSize()
            .foregroundColor(.white)
        
        return foreground
            .background(background)
        
    }
}

extension View {
    func equalSize()-> some View{
        self.modifier(EqualSize())
        
    }
    
    func equalSizes()-> some View{
        self.modifier(EqualSizes())
    }
}

struct SizeEnvironmentkey: EnvironmentKey{
    static let defaultValue: CGSize? = nil
}

extension EnvironmentValues {
    var size: CGSize? {
        get { self[SizeEnvironmentkey.self]}
        set { self[SizeEnvironmentkey.self] = newValue }
    }
}

struct SizeKey: PreferenceKey{
    static var defaultValue: [CGSize] = []
    static func reduce(value: inout [CGSize], nextValue: () -> [CGSize]) {
        value.append(contentsOf: nextValue())
    }
}


fileprivate struct EqualSize: ViewModifier{
    @Environment(\.size) private var buttonSize
    @State var width: CGFloat?
    
    func body(content: Content) -> some View {
        
        content
            .overlay(GeometryReader { geo in
                Color.clear.preference(key: SizeKey.self, value: [geo.size])
            })
            .frame(width: buttonSize?.width , height: buttonSize?.height)
    }
}

fileprivate struct EqualSizes: ViewModifier{
    @State var width: CGFloat?
    func body(content: Content) -> some View {
        content
            .onPreferenceChange(SizeKey.self, perform: { sizes in
                self.width = sizes.map{ $0.width }.max()
            })
            .environment(\.size, width.map {CGSize(width: $0, height: $0)} )
    }
}



